import 'package:censible_app/components/element/cust_loadingcard.dart';
import 'package:censible_app/controllers/PAGE/category_controller.dart';
import 'package:censible_app/data/ACCOUNT/account_data.dart';
import 'package:censible_app/model/ACCOUNT/account_model.dart';
import 'package:censible_app/model/CALCULATE/calculator_model.dart';
import 'package:censible_app/model/CATEGORY/category_model.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalculatorController extends GetxController {
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Current user ID (dynamically fetched)
  String? currentUserId;

  var NotesController = TextEditingController();
  String selectedDate = DateTime.now().toString();
  var color = Application();
  String selectedTime = DateFormat('hh:mm a')
      .format(DateTime.now()); // Holds the selected time text

  String displayValue = "0";

  ///CATEGORY FETCHING///
  var storedCategory = ''.obs;
  var storedIcon = ''.obs;
  var selectedCategoryObject =
      Rx<CategoryModel?>(null); // Rx<CategoryModel> to store the entire object

  void selectCategory(CategoryModel category) {
    storedCategory.value = category.name!;
    storedIcon.value = category.icon!;
    selectedCategoryObject.value = category;
    update();
  }

  ///ACCOUNT FETCHING///
  var storedAccount = ''.obs;
  var storedAccountIcon = ''.obs;
  var selectedAccountObject =
      Rx<AccountModel?>(null); // Rx<CategoryModel> to store the entire object

  void selectAccount(AccountModel account) {
    storedAccount.value = account.name!;
    storedAccountIcon.value = account.icon!;
    selectedAccountObject.value = account;
    update();
    print(storedAccountIcon.value);
  }

// Default selected category
  final RxString selectedCategory = 'EXPENSE'.obs;

  /// Dynamic button text based on the selected category or stored value
  String _getButtonText(String? value, String defaultValue) {
    return value?.isEmpty ?? true ? defaultValue : value!.toUpperCase();
  }

  String get firstButtonText => _getButtonText(storedAccount.value, 'ACCOUNT');
  String get secondButtonText =>
      _getButtonText(storedCategory.value, 'CATEGORY');

  /// Dynamic title text based on the selected category or stored value
  String _getTitleText(String? value, String defaultTitle) {
    return value?.isEmpty ?? true ? defaultTitle : defaultTitle;
  }

  String get firstTitleText => _getTitleText(storedCategory.value, 'ACCOUNT');
  String get secondTitleText => _getTitleText(storedCategory.value, 'CATEGORY');

  /// Dynamic icons based on the selected category
  String _getButtonIcon(String? iconValue, String defaultIcon) {
    return iconValue?.isEmpty ?? true ? defaultIcon : iconValue!;
  }

  String get firstButtonIcon =>
      _getButtonIcon(storedAccountIcon.value, icon.ACCOUNTS_FILL);
  String get secondButtonIcon =>
      _getButtonIcon(storedIcon.value, icon.CATEGORY_FILL);

// Function to update the selected category
  void updateCategory(String category) {
    selectedCategory.value = category;
  }

  void onButtonPressed(String value) {
    // Remove error when inputting again
    if (displayValue == "Error") {
      displayValue = "0";
    }

    if (value == "C") {
      // Clear the display
      displayValue = "0";
    } else if (value == "=") {
      // Calculate the expression
      try {
        displayValue = calculate(displayValue);
      } catch (e) {
        displayValue = "Error";
      }
    } else {
      // Allow negative sign at the start
      if (displayValue == "0" && value == "-") {
        displayValue = value;
      }
      // Prevent multiple operators except negative after an operator
      else if (isOperator(displayValue[displayValue.length - 1]) &&
          isOperator(value) &&
          value != "-") {
        return;
      }
      // Update the display
      else {
        if (displayValue == "0" && isNumber(value)) {
          displayValue = value;
        } else {
          displayValue += value;
        }
      }
    }
    update();
  }

  String calculate(String expression) {
    try {
      // Validate the expression (no trailing operators)
      if (isOperator(expression[expression.length - 1])) {
        throw Exception("Invalid Expression");
      }

      // Parse and calculate
      final tokens = tokenize(expression);
      final result = evaluate(tokens);

      // Ensure integer values do not display a dot
      return result % 1 == 0 ? result.toInt().toString() : result.toString();
    } catch (e) {
      return "Error";
    }
  }

  List<String> tokenize(String expression) {
    final tokens = <String>[];
    final buffer = StringBuffer();

    for (int i = 0; i < expression.length; i++) {
      final char = expression[i];

      // Check if it's a negative sign for a number
      if (char == '-' && (i == 0 || isOperator(expression[i - 1]))) {
        buffer.write(char); // Append negative sign to the number
      } else if (isOperator(char)) {
        if (buffer.isNotEmpty) {
          tokens.add(buffer.toString());
          buffer.clear();
        }
        tokens.add(char);
      } else {
        buffer.write(char);
      }
    }

    if (buffer.isNotEmpty) {
      tokens.add(buffer.toString());
    }

    return tokens;
  }

  double evaluate(List<String> tokens) {
    // Apply operators with precedence
    final operators = ['\u00D7', '\u00F7', '+', '-'];
    while (tokens.length > 1) {
      for (final operator in operators) {
        final index = tokens.indexOf(operator);
        if (index != -1) {
          final left = double.parse(tokens[index - 1]);
          final right = double.parse(tokens[index + 1]);
          double result;
          switch (operator) {
            case '\u00D7':
              result = left * right;
              break;
            case '\u00F7':
              result = left / right;
              break;
            case '+':
              result = left + right;
              break;
            case '-':
              result = left - right;
              break;
            default:
              throw Exception("Unknown operator");
          }
          tokens.replaceRange(index - 1, index + 2, [result.toString()]);
          break;
        }
      }
    }
    return double.parse(tokens[0]);
  }

  bool isOperator(String value) {
    return ["+", "-", "\u00D7", "\u00F7"].contains(value);
  }

  bool isNumber(String value) {
    return double.tryParse(value) != null;
  }

  // Custom border
  final CustBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Application().color.primaryDark, width: 2));

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: color.color.primary,
                onPrimary: color.color.white,
                surface: color.color.white,
                onSurface: color.dark.lightCharcoal,
              ),
            ),
            child: child!,
          );
        });
    if (pickedDate != null) {
      selectedDate = "${pickedDate.toLocal()}".split(' ')[0]; // Format the date
      update();
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
              primary: color.color.primary,
            )),
            child: child!,
          );
        });
    if (pickedTime != null) {
      selectedTime = pickedTime.format(context);
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    openUserBox();
    // fetchAccounts();
  }

  // Fetch the current user ID
  Future<void> openUserBox() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      currentUserId = user.uid;
    } else {
      showSnackbar('Error', 'No user is currently signed in.', Icons.error);
    }
  }

  Future<void> createCalculateCard(BuildContext context) async {
    if (currentUserId == null) {
      showSnackbar('Error', 'User not authenticated.', Icons.error);
      return;
    }

    // Generalized validation for required fields
    bool isFormValid = validateForm();
    if (!isFormValid) return;

    try {
      showCustLoadingcard(context);
      // Retrieve the current ACCOUNT_DATA
      final userDoc =
          await _firestore.collection("USER_ACCOUNT").doc(currentUserId).get();
      final accountDataList = List<Map<String, dynamic>>.from(
          userDoc.data()?["ACCOUNT_DATA"] ?? []);

      // Find the specific account to update
// Find the specific account to update
      final accountToUpdate = accountDataList.firstWhere(
        (element) => element['amount'] == selectedAccountObject.value?.amount,
        orElse: () => {}, // Return an empty Map<String, dynamic>
      );
      if (accountToUpdate == {}) {
        showSnackbar('Error', 'Account not found.', Icons.error);
        return;
      }

      // Perform the calculation based on type: "EXPENSE" or "INCOME"
      double accountAmount = accountToUpdate["amount"] ?? 0.0;
      double enteredValue = double.parse(displayValue);
      double calculationResult;

      // Check if the type is "EXPENSE" or "INCOME"
      if (selectedCategory.value == "EXPENSE") {
        // For expense, subtract the entered value from the account amount
        calculationResult = accountAmount - enteredValue;
      } else if (selectedCategory.value == "INCOME") {
        // For income, add the entered value to the account amount
        calculationResult = accountAmount + enteredValue;
      } else {
        showSnackbar('Form Error', 'Invalid category type.', Icons.error);
        return;
      }

      // Update the account balance
      final updatedAccountData = {
        "name": accountToUpdate["name"],
        "amount": calculationResult,
        "balance": calculationResult, // Update balance as well
        "icon": accountToUpdate["icon"], // Assuming the icon doesn't change
        "updatedAt": Timestamp.now(),
      };

      // Update Firestore with arrayRemove and arrayUnion to update the account data
      await _firestore.collection("USER_ACCOUNT").doc(currentUserId).update({
        "ACCOUNT_DATA": FieldValue.arrayRemove([accountToUpdate]),
      });
      await _firestore.collection("USER_ACCOUNT").doc(currentUserId).update({
        "ACCOUNT_DATA": FieldValue.arrayUnion([updatedAccountData]),
      });

      // Create the CalculateModel instance with the calculation result
      final calculateData = RecordModel(
        id: currentUserId,
        type: selectedCategory.value,
        account: selectedAccountObject.value,
        category: selectedCategoryObject.value,
        inputValue: displayValue,
        notes: NotesController.text,
        calculation: calculationResult, // Use the calculated result here
        dateTime: DateTime.parse(selectedDate),
        time: selectedTime,
      );

      // Save data to Firestore for calculation record
      await _firestore.collection("USER_ACCOUNT").doc(currentUserId).set({
        "CALCULATE_DATA": FieldValue.arrayUnion([calculateData.toMap()]),
      }, SetOptions(merge: true));

      // Update UI and show success message
      update();
      Get.back();
      Get.back();
      showSnackbar(
          'Form Successful', 'The calculation has been saved.', Icons.check);
    } catch (e) {
      showSnackbar(
          'Form Error', 'An error occurred. Please try again.', Icons.error);
    }
  }

  // Future<void> EditCalculateCard(BuildContext context) async {
  //   if (currentUserId == null) {
  //     showSnackbar('Error', 'User not authenticated.', Icons.error);
  //     return;
  //   }

  //   // Generalized validation for required fields
  //   bool isFormValid = validateForm();
  //   if (!isFormValid) return;

  //   try {
  //     showCustLoadingcard(context);
  //     // Retrieve the current ACCOUNT_DATA
  //     final userDoc =
  //         await _firestore.collection("USER_ACCOUNT").doc(currentUserId).get();
  //     final accountDataList = List<Map<String, dynamic>>.from(
  //         userDoc.data()?["ACCOUNT_DATA"] ?? []);

  //     // Find the specific account to update
  //     final accountToUpdate = accountDataList.firstOrNull!;

  //     if (accountToUpdate == null) {
  //       showSnackbar('Error', 'Account not found.', Icons.error);
  //       return;
  //     }

  //     // Perform the calculation based on type: "EXPENSE" or "INCOME"
  //     double accountAmount = accountToUpdate["amount"] ?? 0.0;
  //     double enteredValue = double.parse(displayValue);
  //     double calculationResult;

  //     // Check if the type is "EXPENSE" or "INCOME"
  //     if (selectedCategory.value == "EXPENSE") {
  //       // For expense, subtract the entered value from the account amount
  //       calculationResult = accountAmount - enteredValue;
  //     } else if (selectedCategory.value == "INCOME") {
  //       // For income, add the entered value to the account amount
  //       calculationResult = accountAmount + enteredValue;
  //     } else {
  //       showSnackbar('Form Error', 'Invalid category type.', Icons.error);
  //       return;
  //     }

  //     // Update the account balance
  //     final updatedAccountData = {
  //       "name": accountToUpdate["name"],
  //       "amount": calculationResult,
  //       "balance": calculationResult, // Update balance as well
  //       "icon": accountToUpdate["icon"], // Assuming the icon doesn't change
  //       "updatedAt": Timestamp.now(),
  //     };

  //     // Update Firestore with arrayRemove and arrayUnion to update the account data
  //     await _firestore.collection("USER_ACCOUNT").doc(currentUserId).update({
  //       "ACCOUNT_DATA": FieldValue.arrayRemove([accountToUpdate]),
  //     });
  //     await _firestore.collection("USER_ACCOUNT").doc(currentUserId).update({
  //       "ACCOUNT_DATA": FieldValue.arrayUnion([updatedAccountData]),
  //     });

  //     // Create the CalculateModel instance with the calculation result
  //     final calculateData = RecordModel(
  //       id: currentUserId,
  //       type: selectedCategory.value,
  //       account: selectedAccountObject.value,
  //       category: selectedCategoryObject.value,
  //       inputValue: ,
  //       notes: NotesController.text.isEmpty ? "No notes" : NotesController.text,
  //       calculation: calculationResult, // Use the calculated result here
  //       dateTime: DateTime.parse(selectedDate),
  //       time: selectedTime,
  //     );

  //     // Save data to Firestore for calculation record
  //     await _firestore.collection("USER_ACCOUNT").doc(currentUserId).set({
  //       "CALCULATE_DATA": FieldValue.arrayUnion([calculateData.toMap()]),
  //     }, SetOptions(merge: true));

  //     // Update UI and show success message
  //     update();
  //     Get.back();
  //     Get.back();
  //     showSnackbar(
  //         'Form Successful', 'The calculation has been saved.', Icons.check);
  //   } catch (e) {
  //     showSnackbar(
  //         'Form Error', 'An error occurred. Please try again.', Icons.error);
  //   }
  // }

  bool validateForm() {
    // Check if required fields are filled or selected
    if (selectedCategory.value?.isEmpty ?? true) {
      showErrorSnackbar(
          'Form Incomplete', 'Please select a category.', Icons.error);
      return false;
    }
    if (selectedAccountObject.value == null) {
      showErrorSnackbar(
          'Form Incomplete', 'Please select an account.', Icons.error);
      return false;
    }
    if (selectedCategoryObject.value == null) {
      showErrorSnackbar(
          'Form Incomplete', 'Please select a category.', Icons.error);
      return false;
    }

    if (displayValue.isEmpty || double.tryParse(displayValue) == null) {
      showErrorSnackbar('Form Incomplete',
          'Please enter a valid calculation value.', Icons.error);
      return false;
    }
    if (selectedDate.isEmpty) {
      showErrorSnackbar(
          'Form Incomplete', 'Please select a date.', Icons.error);
      return false;
    }
    if (selectedTime.isEmpty) {
      showErrorSnackbar(
          'Form Incomplete', 'Please select a time.', Icons.error);
      return false;
    }
    return true;
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
}
