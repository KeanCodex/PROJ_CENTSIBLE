import 'dart:ffi';
import 'dart:ui';

import 'package:censible_app/components/validation/cust_isValid.dart';
import 'package:censible_app/components/validation/cust_loadingAlert.dart';
import 'package:censible_app/components/validation/cust_validationAlert.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:censible_app/helper/DBHelper/db_helper.dart';
import 'package:censible_app/routes/screen_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isPasswordVisible = false;

  String? _errorCode;
  String? _name;
  String? _email;
  String? _gender;
  String? _address;
  String? _birthdate;
  String? _phoneNumber;
  String? _imageEmail;
  String? _uid;
  String? _imageUrl;
  String? _provider;
  bool _hasError = false;
  bool _isSignedIn = false;

  // Getters for each variable
  String? get name => _name;
  String? get email => _email;
  String? get uid => _uid;
  String? get imageUrl => _imageUrl;
  String? get imageEmail => _imageEmail;
  String? get provider => _provider;
  String? get gender => _gender;
  String? get address => _address;
  String? get birthdate => _birthdate;
  String? get phoneNumber => _phoneNumber;
  bool get isSignedIn => _isSignedIn;
  String? get errorCode => _errorCode;
  bool get hasError => _hasError;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  // # EMAIL LOGIN
  void toSignInConfirm(BuildContext context) async {
    try {
      if (CheckValidation()
          .validateLogin(context, emailController, passwordController)) {
        // Show loading alert
        showLoadingAlert(
            context, "Signing In", "Please wait while we log you in...");

        // Firebase signin
        await DbHelper().loginUser(
          emailController,
          passwordController,
        );

        // After signup is successful, dismiss loading and show success alert
        Navigator.pop(context); // Dismiss loading
        showValidationAlert(
            context, 'Successful', 'Successfully Logged In. ', 'signup', true,
            () {
          emailController.clear();

          passwordController.clear();
          Get.toNamed(ScreenRouter.getSetcurrencyScreenRoute);
        });
      }
    } on FirebaseAuthException catch (ex) {
      String msgtext;

      if (ex.code == 'invalid-credential') {
        msgtext = 'Verify your credentials and try again.';
      } else if (ex.code == 'invalid-email') {
        msgtext = 'Incorrect Email. Please try again.';
      } else if (ex.code == 'wrong-password') {
        msgtext = 'Incorrect Password. Please try again.';
      } else if (ex.code == 'user-not-found') {
        msgtext = 'No account found with this email. Please sign up.';
      } else if (ex.code == 'too-many-requests') {
        msgtext =
            'Too many attempts to sign in with this email. Please try again later.';
      } else {
        msgtext = 'An error occurred: ${ex.message}';
      }

      Navigator.pop(context); // Dismiss loading
      showValidationAlert(context, 'Opps...', msgtext, 'signin', false, () {
        Navigator.pop(context);
      });
    }
  }

  // checkUser exists or not in cloudfirestore
  Future<bool> checkUserExists() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('UserAccount')
        .doc(_uid)
        .get();
    if (snap.exists) {
      print("EXISTING USER");
      return true;
    } else {
      print("NEW USER");
      return false;
    }
  }

  // # GOOGLE LOGIN
  Future signInWithGoogle(BuildContext context, String msgType) async {
    try {
      showLoadingAlert(context, "Logging In",
          "Please wait while we verify your credentials...");

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final User userDetails =
            (await firebaseAuth.signInWithCredential(credential)).user!;

        // Check if the user is new or existing
        bool userExists = await checkUserExists();
        if (!userExists) {
          // If new user, save to Firestore

          final userData = {
            'uid': userDetails.uid,
            'name': userDetails.displayName ?? 'No Name',
            'email': userDetails.email ?? 'No Email',
            'phone': 'No Phone',
            'address': 'No Address',
            'birthdate': 'No Birthdate',
            'photo': userDetails.photoURL ?? '',
            'provider': 'Google',
          };

          await FirebaseFirestore.instance
              .collection("USER_ACCOUNT")
              .doc(userDetails.uid)
              .set({
            "USER_DATA": userData,
          }, SetOptions(merge: true));
        }

        showValidationAlert(
            context, 'Successful', 'Successfully $msgType', msgType, true, () {
          Get.toNamed(ScreenRouter.getSetcurrencyScreenRoute);
          Get.snackbar('Successfully Login',
              'Welcome back, ${userDetails.displayName!}!',
              icon: Icon(Icons.check_circle_outline,
                  color: Application().color.white),
              colorText: Application().color.white,
              snackPosition: SnackPosition.TOP,
              backgroundColor: Application().color.primary);
        });
        update();
      } else {
        _hasError = true;
        update();
      }
    } on FirebaseAuthException catch (e) {
      _handleAuthError(context, e, msgType);
    } catch (e) {
      print("Google sign-in error: $e");
      _hasError = true;
      update();
    }
  }

  Future clearStoredData() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.clear();
  }

  // signout
  Future userSignOut() async {
    await firebaseAuth.signOut;
    await googleSignIn.signOut();

    _isSignedIn = false;
    update();
    // clear all storage information
    clearStoredData();
  }

  void _handleAuthError(
      BuildContext context, FirebaseAuthException e, String msgType) {
    final errorMsg = _getErrorMessage(e.code);
    showValidationAlert(context, 'Opps...', errorMsg, msgType, false, () {
      Navigator.of(context).pop();
    });
  }

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-credential':
        return 'Verify your credentials and try again.';
      case 'invalid-email':
        return 'Incorrect Email';
      case 'too-many-requests':
        return 'Account Temporarily Disabled';
      default:
        return 'Unknown Error Occurred';
    }
  }

  // # TOGGLED
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }
}
