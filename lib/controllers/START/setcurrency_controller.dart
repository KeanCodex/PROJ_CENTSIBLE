import 'package:censible_app/components/validation/cust_validationAlert.dart';
import 'package:censible_app/data/currency_data.dart';
import 'package:censible_app/routes/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetcurrencyController extends GetxController {
  int _selectedCurrencyIndex = 23;

  int get selectedCurrencyIndex => _selectedCurrencyIndex;

  set selectedCurrencyIndex(int value) {
    _selectedCurrencyIndex = value;
    update(); // Call update to notify listeners
  }

  void validateCurrencySelection(BuildContext context) async {
    if (selectedCurrencyIndex == -1) {
      showValidationAlert(
        context,
        "No selected",
        "Please select a currency to proceed.",
        "currencySelection",
        false,
        () {
          Navigator.pop(context); // Close the validation alert
        },
      );
    } else {
      final selectedCurrency = currencies[selectedCurrencyIndex];
      showValidationAlert(
        context,
        "Currency Selected",
        "Your selected currency (${selectedCurrency['Code']}) has been saved.",
        "currencySelection",
        true,
        () {
          Get.toNamed(ScreenRouter.getCtrlScreenRoute);
        },
      );
    }
  }
}
