import 'package:censible_app/components/snackbar/cust_snackbar.dart';
import 'package:censible_app/components/validation/cust_isValid.dart';
import 'package:censible_app/components/validation/cust_loadingAlert.dart';
import 'package:censible_app/components/validation/cust_validationAlert.dart';
import 'package:censible_app/helper/DBHelper/db_helper.dart';
import 'package:censible_app/routes/screen_routes.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';

class SignupController extends GetxController {
  // Text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final birthDateController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var color = Application();

  // Toggle variables
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    update();
  }

  void toSignUpConfirm(BuildContext context) async {
    try {
      if (CheckValidation().validation(
          context,
          nameController,
          emailController,
          phoneController,
          addressController,
          birthDateController,
          passwordController,
          confirmPasswordController)) {
        // Show loading alert
        showLoadingAlert(context, "Signing Up",
            "Please wait while we create your account...");

        // Firebase signup
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        // Create user in Firestore

        final userData = {
          'uid': userCredential.user!.uid,
          'name': nameController.text,
          'email': emailController.text,
          'provider': 'Email',
          'phone': phoneController.text,
          'address': addressController.text,
          'birthdate': birthDateController.text,
          'photo': color.icon.PHONE,
        };

        await FirebaseFirestore.instance
            .collection("USER_ACCOUNT")
            .doc(userCredential.user!.uid)
            .set({
          "USER_DATA": userData,
        }, SetOptions(merge: true)).then((_) {
          Navigator.pop(context); // Dismiss loading
          showValidationAlert(
            context,
            'Successful',
            'Successfully registered. You can now sign in.',
            'signup',
            true,
            () {
              // Clear the controllers
              nameController.clear();
              emailController.clear();
              phoneController.clear();
              addressController.clear();
              birthDateController.clear();
              passwordController.clear();
              confirmPasswordController.clear();

              // Redirect to SignIn screen
              Get.toNamed(ScreenRouter.getSigninScreenRoute);
            },
          );
        }).catchError((error) {
          Navigator.pop(context); // Dismiss loading
          showValidationAlert(
            context,
            'Error',
            'Failed to save user data: ${error.toString()}',
            'signup',
            false,
            () {
              Navigator.pop(context);
            },
          );
        });
      }
    } on FirebaseAuthException catch (ex) {
      String msgtext;
      if (ex.code == 'email-already-in-use') {
        msgtext = 'Email already registered.';
      } else if (ex.code == 'weak-password') {
        msgtext = 'Password must be at least 6 characters.';
      } else {
        msgtext = 'An error occurred: ${ex.message}';
      }

      Navigator.pop(context); // Dismiss loading
      showValidationAlert(context, 'Opps...', msgtext, 'signup', false, () {
        Navigator.pop(context);
      });
    }
  }
}
