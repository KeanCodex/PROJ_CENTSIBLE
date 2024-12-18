import 'package:censible_app/components/utility/cust_account_bottom_dialog.dart';
import 'package:censible_app/components/utility/cust_category_bottom_dialog.dart';
import 'package:censible_app/controllers/CALCU/calculator_controller.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderCalcu extends StatelessWidget {
  HeaderCalcu({super.key});

  // Initialize the controller
  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Top Buttons (Cancel & Save)
          _buildTopButtons(context),

          // Category Buttons (Income, Expense)
          _buildCategoryButtons(),

          // Dynamic Account and Category Buttons
          _buildDynamicButtons(context),
        ],
      ),
    );
  }

  Widget _buildTopButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTextButton('CANCEL', Icons.close, () => Get.back()),
          _buildTextButton('SAVE', Icons.check,
              () => controller.createCalculateCard(context)),
        ],
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCategoryButton('INCOME'),
          Text('|', style: _dividerStyle()),
          _buildCategoryButton('EXPENSE'),
        ],
      ),
    );
  }

  Widget _buildDynamicButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Obx(() => Text(
                      controller.firstTitleText,
                      style: _buttonLabelStyle(),
                    )),
                const SizedBox(height: 5),
                Obx(
                  () => _buildActionButton(
                    context,
                    controller.firstButtonIcon,
                    controller.firstButtonText,
                    () => showCustomAccountModal(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Obx(() => Text(
                      controller.secondTitleText,
                      style: _buttonLabelStyle(),
                    )),
                const SizedBox(height: 5),
                Obx(() => _buildActionButton(
                      context,
                      controller.secondButtonIcon,
                      controller.secondButtonText,
                      () {
                        showCustomCategoryModal(context);
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return Obx(() {
      return TextButton(
        style: TextButton.styleFrom(
          elevation: 3,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: () => controller.updateCategory(category),
        child: Row(
          children: [
            if (controller.selectedCategory.value == category)
              Icon(Icons.check_box,
                  color: Application().color.primaryDark, size: 20),
            Text(category, style: _categoryButtonStyle()),
          ],
        ),
      );
    });
  }

  Widget _buildActionButton(
    BuildContext context,
    String iconPath,
    String buttonText,
    VoidCallback onPressed,
  ) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize:
            const Size(double.infinity, 45), // This sets the minimum height
        fixedSize:
            const Size(double.infinity, 45), // This sets the fixed height
        elevation: 3,
        backgroundColor: Application().color.primarylight,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          side: BorderSide(color: Application().color.primaryDark, width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, scale: 16),
          const SizedBox(width: 5),
          Text(buttonText, style: _categoryButtonStyle()),
        ],
      ),
    );
  }

  Widget _buildTextButton(String text, IconData icon, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        elevation: 3,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(),
      ),
      child: Row(
        children: [
          Icon(icon, color: Application().color.primaryDark, size: 16),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 1,
                color: Application().color.primaryDark),
          ),
        ],
      ),
    );
  }

  TextStyle _categoryButtonStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      letterSpacing: 1,
      color: Application().color.primaryDark.withOpacity(0.9),
    );
  }

  TextStyle _dividerStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        letterSpacing: 1,
        color: Application().color.primaryDark);
  }

  TextStyle _buttonLabelStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        letterSpacing: 1,
        color: Application().color.primaryDark);
  }
}
