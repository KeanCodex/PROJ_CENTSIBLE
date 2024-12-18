import 'package:censible_app/components/element/cust_loadingcard.dart';
import 'package:censible_app/components/validation/cust_isValid.dart';
import 'package:censible_app/data/ACCOUNT/account_data.dart';
import 'package:censible_app/model/ACCOUNT/account_model.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  // Controllers for input fields
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  var listAccount = <AccountModel>[].obs; // Reactive list

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Current user ID (dynamically fetched)
  String? currentUserId;

  // Selected image index
  int selectedImageIndex = 0;

  // List of available account icons
  final List<String> images = [
    icon.MONEY,
    icon.CARD,
    icon.SAVINGS,
    icon.MASTER,
    icon.VISA,
    icon.COINS,
    icon.WALLET
  ];

  // Border style for input fields
  final custBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
        color: color.color.primaryDark, width: 1.5), // Adjust color as needed
  );

  @override
  void onInit() {
    super.onInit();
    openUserBox();
    fetchAccounts();
  }

  // Fetch the current user ID
  Future<void> openUserBox() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      currentUserId = user.uid;
    } else {
      showErrorSnackbar(
          'Error', 'No user is currently signed in.', Icons.error);
    }
  }

  // Create a new account and save it to Firestore
  Future<void> createAccountCard(BuildContext context) async {
    if (currentUserId == null) {
      showErrorSnackbar('Error', 'User not authenticated.', Icons.error);
      return;
    }

    if (nameController.text.isEmpty ||
        amountController.text.isEmpty ||
        selectedImageIndex == -1) {
      showErrorSnackbar(
          'Form Incomplete', 'Please fill all the fields.', Icons.error);
      return;
    }
    try {
      showCustLoadingcard(context);

      final accountData = {
        "name": nameController.text,
        "amount": amountController.text.isEmpty
            ? 0.00
            : double.parse(amountController.text),
        "balance": amountController.text.isEmpty
            ? 0.00
            : double.parse(amountController.text),
        "icon": images[selectedImageIndex],
        "createdAt": Timestamp.now(),
      };

      await _firestore.collection("USER_ACCOUNT").doc(currentUserId).set({
        "ACCOUNT_DATA": FieldValue.arrayUnion([accountData]),
      }, SetOptions(merge: true));

      clearInputFields();
      await fetchAccounts();
      update();

      Get.back();
      Get.back();
      showSnackbar(
        'Form Successful',
        'The account has been created.',
        Icons.check,
      );
    } catch (e) {
      showErrorSnackbar(
          'Form Incomplete', 'Please fill all the fields.', Icons.error);
    }
  }

  // Edit an existing account by its index
  Future<void> editAccountCard(int accountIndex, BuildContext context) async {
    if (currentUserId == null) {
      showErrorSnackbar('Error', 'User not authenticated.', Icons.error);
      return;
    }

    try {
      showCustLoadingcard(context);

      // Retrieve the current ACCOUNT_DATA
      final userDoc =
          await _firestore.collection("USER_ACCOUNT").doc(currentUserId).get();
      final accountDataList = List<Map<String, dynamic>>.from(
          userDoc.data()?["ACCOUNT_DATA"] ?? []);

      // Find the specific account to edit
      final accountToEdit = accountDataList[accountIndex];

      // Update the account data with new values
      final updatedAccountData = {
        "name": nameController.text,
        "amount": amountController.text.isEmpty
            ? 0.00
            : double.parse(amountController.text),
        "balance": amountController.text.isEmpty
            ? 0.00
            : double.parse(amountController.text),
        "icon": images[selectedImageIndex],
        "updatedAt": Timestamp.now(),
      };

      // Update Firestore with arrayRemove and arrayUnion
      await _firestore.collection("USER_ACCOUNT").doc(currentUserId).update({
        "ACCOUNT_DATA": FieldValue.arrayRemove([accountToEdit]),
      });
      await _firestore.collection("USER_ACCOUNT").doc(currentUserId).update({
        "ACCOUNT_DATA": FieldValue.arrayUnion([updatedAccountData]),
      });

      clearInputFields();
      await fetchAccounts();
      update();
      Get.back();
      Get.back();
      showSnackbar(
        'Edit Successful',
        'Account has been updated.',
        Icons.check,
      );
    } catch (e) {
      showErrorSnackbar('Error', 'Failed to edit account: $e', Icons.error);
    }
  }

  // Delete an existing account by its index
  Future<void> deleteAccountCard(int accountIndex, BuildContext context) async {
    if (currentUserId == null) {
      showErrorSnackbar('Error', 'User not authenticated.', Icons.error);
      return;
    }

    try {
      showCustLoadingcard(context);

      // Retrieve the current ACCOUNT_DATA
      final userDoc =
          await _firestore.collection("USER_ACCOUNT").doc(currentUserId).get();
      final accountDataList = List<Map<String, dynamic>>.from(
          userDoc.data()?["ACCOUNT_DATA"] ?? []);

      // Find the specific account to remove
      final accountToRemove = accountDataList[accountIndex];

      // Update Firestore with arrayRemove
      await _firestore.collection("USER_ACCOUNT").doc(currentUserId).update({
        "ACCOUNT_DATA": FieldValue.arrayRemove([accountToRemove]),
      });

      // Remove the account from the list
      listAccount.removeAt(accountIndex);

      await fetchAccounts();
      update();
      Get.back();
      Get.back();
      showSnackbar(
          'Delete Successful', 'Account has been deleted.', Icons.check);
    } catch (e) {
      showErrorSnackbar('Error', 'Failed to delete account: $e', Icons.error);
    }
  }

  Future<void> fetchAccounts() async {
    if (currentUserId == null) {
      _showErrorSnackbar('User not authenticated.');
      return;
    }

    try {
      final userDoc =
          await _firestore.collection("USER_ACCOUNT").doc(currentUserId).get();

      if (!userDoc.exists) {
        _showErrorSnackbar('No user data found.');
        return;
      }

      // Safely get ACCOUNT_DATA or an empty list if not present
      final accountDataList =
          userDoc.get('ACCOUNT_DATA') as List<dynamic>? ?? [];

      // Update accounts only if there's data
      if (accountDataList.isNotEmpty) {
        listAccount.value = accountDataList
            .map((data) => AccountModel(
                  id: '',
                  name: data['name'],
                  amount: data['amount'],
                  balance: data['balance'],
                  icon: data['icon'],
                ))
            .toList();
        update();
        printAccounts(); // Optional logging
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _showErrorSnackbar(String message) {
    showErrorSnackbar('Error', message, Icons.error);
  }

  void printAccounts() {
    listAccount.value.forEach((account) => print(account));
  }

  // Clear input fields after an operation
  void clearInputFields() {
    nameController.clear();
    amountController.clear();
    selectedImageIndex = 0;
  }

  // Show a snackbar notification
  void showSnackbar(String title, String message, IconData icon) {
    Get.snackbar(
      title,
      message,
      backgroundColor: color.color.primary, // Adjust color as needed
      colorText: color.color.white,
      icon: Icon(
        icon,
        color: color.color.white,
      ),
    );
  }

  void showErrorSnackbar(String title, String message, IconData icon) {
    Get.snackbar(
      title,
      message,
      backgroundColor: color.color.invalid, // Adjust color as needed
      colorText: color.color.white,
      icon: Icon(
        icon,
        color: color.color.white,
      ),
    );
  }
}
