import 'package:censible_app/components/snackbar/cust_snackbar.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var color = Application();

class CheckValidation {
  bool isValidNumber(String number) {
    final numberRegex = RegExp(r'^09\d{9}$');
    return numberRegex.hasMatch(number);
  }

  bool isValidPassword(String password) {
    final passwordRegex = RegExp(
      r'^(?=.*[a-zA-Z])(?=.*[@#$])(?=.*[0-9]).{8,}$',
    );
    return passwordRegex.hasMatch(password);
  }

  bool validation(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController phoneController,
      TextEditingController addressController,
      TextEditingController birthDateController,
      TextEditingController passwordController,
      TextEditingController confirmPasswordController) {
    var color = Application();
    // Step 1: Check required fields
    if (nameController.text.isEmpty &&
        emailController.text.isEmpty &&
        phoneController.text.isEmpty &&
        addressController.text.isEmpty &&
        birthDateController.text.isEmpty &&
        passwordController.text.isEmpty &&
        confirmPasswordController.text.isEmpty) {
      // Show error alert
      Get.snackbar('Form Incomplete', 'Please fill all the fields.',
          backgroundColor: color.color.invalid.withOpacity(0.8),
          colorText: color.color.white,
          icon: Icon(
            Icons.error_outline_outlined,
            color: color.color.white,
          ));
      return false;
    }

    // Step 2: Validate email
    if (!EmailValidator.validate(emailController.text)) {
      // Show error alert
      CustomSnackbar.showSnackbar(
        'Form Incomplete',
        'Please enter a valid email address.',
        backgroundColor: color.color.invalid.withOpacity(0.8),
        textColor: color.color.white,
        icon: Icons.error_outline_outlined,
      );
      return false;
    }

    // Step 3: Validate phone number
    if (!isValidNumber(phoneController.text)) {
      // Show error alert
      CustomSnackbar.showSnackbar(
        'Form Incomplete',
        'Number must start with 09 and be 11 digits long.',
        backgroundColor: color.color.invalid.withOpacity(0.8),
        textColor: color.color.white,
        icon: Icons.error_outline_outlined,
      );

      return false;
    }

    // Step 4: Validate password
    if (!isValidPassword(passwordController.text)) {
      // Show error alert
      CustomSnackbar.showSnackbar(
        'Form Incomplete',
        'Password must be at least 8 characters long, contain a letter, a number, and a special character.',
        backgroundColor: color.color.invalid.withOpacity(0.8),
        textColor: color.color.white,
        icon: Icons.error_outline_outlined,
      );

      return false;
    }

    // Step 5: Confirm passwords match
    if (passwordController.text != confirmPasswordController.text) {
      // Show error alert
      CustomSnackbar.showSnackbar(
        'Form Incomplete',
        'Passwords do not match.',
        backgroundColor: color.color.invalid.withOpacity(0.8),
        textColor: color.color.white,
        icon: Icons.error_outline_outlined,
      );

      return false;
    }

    return true;
  }

  // # Validation Login
  bool validateLogin(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    // Step 1: Check required fields
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      // Show error alert
      Get.snackbar('Form Incomplete', 'Please fill all the fields.',
          backgroundColor: color.color.invalid.withOpacity(0.8),
          colorText: color.color.white,
          icon: Icon(
            Icons.error_outline_outlined,
            color: color.color.white,
          ));
      return false;
    }

    // Step 2: Validate email
    if (!EmailValidator.validate(emailController.text)) {
      // Show error alert
      CustomSnackbar.showSnackbar(
        'Invalid Email',
        'Please enter a valid email address.',
        backgroundColor: color.color.invalid.withOpacity(0.8),
        textColor: color.color.white,
        icon: Icons.error_outline_outlined,
      );
      return false;
    }

    return true;
  }

  bool validateInputData(TextEditingController nameController,
      TextEditingController amountController, int selectedImageIndex) {
    if (nameController.text.isEmpty ||
        amountController.text.isEmpty ||
        selectedImageIndex == -1) {
      CustomSnackbar.showSnackbar(
        'Error',
        'Please fill in all required fields.',
        backgroundColor: color.color.invalid.withOpacity(0.8),
        textColor: color.color.white,
        icon: Icons.error_outline_outlined,
      );
      return false;
    }

    // Additional validation for amount and balance
    if (double.parse(amountController.text) < 0 ||
        double.parse(amountController.text) > 1000000) {
      CustomSnackbar.showSnackbar(
        'Error',
        'Invalid amount.',
        backgroundColor: color.color.invalid.withOpacity(0.8),
        textColor: color.color.white,
        icon: Icons.error_outline_outlined,
      );
      return false;
    }

    return true;
  }
}
