import 'package:censible_app/components/element/cust_loadingcard.dart';
import 'package:censible_app/data/CATEGORY/category_data.dart';
import 'package:censible_app/model/ACCOUNT/account_model.dart';
import 'package:censible_app/model/CATEGORY/category_model.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final nameController = TextEditingController();
  var listCategory = <CategoryModel>[].obs;

  var color = Application();

  String? _selectedType;

  String? get selectedType => _selectedType;

  set selectedType(String? value) {
    _selectedType = value;
    print(_selectedType);
    update();
  }

  void setSelectedType(String type) {
    selectedType = type;
    update(); // Notify GetBuilder to rebuild
  }

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Current user ID (dynamically fetched)
  String? currentUserId;

  // Selected image index
  int selectedImageIndex = 0;

  // List of available category icons
  final List<String> images = [
    icon.ACCESSORIES,
    icon.APPLIANCES,
    icon.AWARD,
    icon.BABY,
    icon.BOOK,
    icon.CAMP,
    icon.CAPITAL,
    icon.CAR,
    icon.CLOTHES,
    icon.COFFEE,
    icon.DEPTCARD,
    icon.EDUCATION,
    icon.ELECTRICITY,
    icon.FOOD,
    icon.FREELANCE,
    icon.GAME,
    icon.GAS,
    icon.GYM,
    icon.HAIRCUT,
    icon.HEALTH,
    icon.HOUSE,
    icon.INSURANCE,
    icon.INTERTAINMENT,
    icon.LAUNDRY,
    icon.LOTTERY,
    icon.MEMORY,
    icon.NEWSPAPER,
    icon.PETCARE,
    icon.PRESENT,
    icon.PURSE,
    icon.RADIO,
    icon.RECYCLE,
    icon.RENT,
    icon.SALES,
    icon.SECURITY,
    icon.SHOPPING,
    icon.SPORTS,
    icon.TAX,
    icon.TELEPHONE,
    icon.TICKET,
    icon.TOOLS,
    icon.TRANSPORTATION,
    icon.TRAVEL,
    icon.WATER,
    icon.WIFI,
  ];

  // Border style for input fields
  final custBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
        color: Application().color.primaryDark,
        width: 1.5), // Adjust color as needed
  );

  @override
  void onInit() {
    super.onInit();
    openUserBox();
    fetchCategory();

    // Deferring the update call to avoid calling during the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Set selected type after build completes
      if (_selectedType == null) {
        _selectedType = 'INCOME'; // Default value if null
      }
      update(); // Safely trigger update after build
    });
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
  Future<void> createCategoryCard(BuildContext context) async {
    if (currentUserId == null) {
      showErrorSnackbar('Error', 'User not authenticated.', Icons.error);
      return;
    }

    if (nameController.text.isEmpty ||
        selectedImageIndex == -1 ||
        _selectedType == null) {
      showSnackbar(
          'Form Incomplete', 'Please fill all the fields.', Icons.error);
      return;
    }

    try {
      // Show loading indicator
      showCustLoadingcard(context);

      final categoryData = {
        "type": _selectedType,
        "name": nameController.text,
        "icon": images[selectedImageIndex],
        "createdAt": Timestamp.now(),
      };

      // Save to Firestore
      await _firestore.collection("USER_ACCOUNT").doc(currentUserId).set({
        "CATEGORY_DATA": FieldValue.arrayUnion([categoryData]),
      }, SetOptions(merge: true));

      // Fetch updated categories and clear input fields
      await fetchCategory();
      clearInputFields();
      update();
      Get.back(); // Close the loading card
      Get.back(); // Close the loading card

      // Hide loading card before showing success message
      showSnackbar(
        'Form Successful',
        'The category has been created.',
        Icons.check,
      );
    } catch (e) {
      // Hide loading card in case of an error
      Get.back(); // Close the loading card
      showSnackbar(
        'Error',
        'Failed to create category. Please try again.',
        Icons.error,
      );
    }
  }

  // Edit an existing account by its index
  Future<void> editCategoryCard(int categoryIndex, BuildContext context) async {
    if (currentUserId == null) {
      showErrorSnackbar('Error', 'User not authenticated.', Icons.error);
      return;
    }

    try {
      showCustLoadingcard(context);
      // Retrieve the current CATEGORY_DATA
      final userDoc =
          await _firestore.collection("USER_ACCOUNT").doc(currentUserId).get();
      final categoryDataList = List<Map<String, dynamic>>.from(
          userDoc.data()?["CATEGORY_DATA"] ?? []);

      // Find the specific account to edit
      final categoryEdit = categoryDataList[categoryIndex];

      // Update the account data with new values
      final updatedcategoryData = {
        "type": _selectedType,
        "name": nameController.text,
        "icon": images[selectedImageIndex],
        "updatedAt": Timestamp.now(),
      };

      // Update Firestore with arrayRemove and arrayUnion
      await _firestore.collection("USER_ACCOUNT").doc(currentUserId).update({
        "CATEGORY_DATA": FieldValue.arrayRemove([categoryEdit]),
      });
      await _firestore.collection("USER_ACCOUNT").doc(currentUserId).update({
        "CATEGORY_DATA": FieldValue.arrayUnion([updatedcategoryData]),
      });

      clearInputFields();
      await fetchCategory();
      update();
      Get.back();
      Get.back();
      showSnackbar(
        'Edit Successful',
        'Category has been updated.',
        Icons.check,
      );
    } catch (e) {
      showErrorSnackbar('Error', 'Failed to edit category: $e', Icons.error);
    }
  }

  // Delete an existing category by its index
  Future<void> deleteCategoryCard(
      int categoryIndex, BuildContext context) async {
    if (currentUserId == null) {
      showErrorSnackbar('Error', 'User not authenticated.', Icons.error);
      return;
    }

    try {
      showCustLoadingcard(context);
      // Retrieve the current CATEGORY_DATA
      final userDoc =
          await _firestore.collection("USER_ACCOUNT").doc(currentUserId).get();
      final categoryDataList = List<Map<String, dynamic>>.from(
          userDoc.data()?["CATEGORY_DATA"] ?? []);

      // Find the specific account to remove
      final accountRemove = categoryDataList[categoryIndex];

      // Update Firestore with arrayRemove
      await _firestore.collection("USER_ACCOUNT").doc(currentUserId).update({
        "CATEGORY_DATA": FieldValue.arrayRemove([accountRemove]),
      });

      // Remove the account from the list
      listCategory.removeAt(categoryIndex);

      await fetchCategory();
      update();
      Get.back();
      Get.back();
      showSnackbar(
          'Delete Successful', 'Category has been deleted.', Icons.check);
    } catch (e) {
      showErrorSnackbar('Error', 'Failed to delete category: $e', Icons.error);
    }
  }

  Future<void> fetchCategory() async {
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

      final categoryDataList =
          userDoc.get('CATEGORY_DATA') as List<dynamic>? ?? [];

      if (categoryDataList.isNotEmpty) {
        // Defer the state update after the widget has built
        WidgetsBinding.instance.addPostFrameCallback((_) {
          listCategory.value = categoryDataList
              .map((data) => CategoryModel(
                    id: '',
                    type: data['type'],
                    name: data['name'],
                    icon: data['icon'],
                  ))
              .toList();
          update(); // Safely trigger update after data fetch
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _showErrorSnackbar(String message) {
    showErrorSnackbar('Error', message, Icons.error);
  }

  void printAccounts() {
    // ignore: invalid_use_of_protected_member
    listCategory.value.forEach((account) => print(account));
  }

  // Clear input fields after an operation
  void clearInputFields() {
    _selectedType = null;
    nameController.clear();
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



      // showCustLoadingcard(context);
