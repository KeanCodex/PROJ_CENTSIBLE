import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void showSnackbar(
    String title,
    String message, {
    Color backgroundColor = Colors.redAccent,
    Color textColor = Colors.white,
    IconData icon = Icons.error_outline_outlined,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor.withOpacity(0.8),
      colorText: textColor,
      icon: Icon(
        icon,
        color: textColor,
      ),
    );
  }
}
