import 'package:censible_app/controllers/CALCU/calculator_controller.dart';
import 'package:censible_app/controllers/PAGE/category_controller.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

var app = Application();

Future<void> showCustomCategoryModal(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: app.color.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    builder: (BuildContext context) {
      return GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Divider(color: app.color.primaryDark, thickness: 3),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Please select a category'.toUpperCase(),
                textAlign: TextAlign.center,
                style: CustomText(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1,
                  color: app.color.primaryDark,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () {
                  return controller.listCategory.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              Image.asset(
                                app.gif.NO_DATA,
                                fit: BoxFit.contain,
                                scale: 3,
                              ),
                              Text(
                                'No Category Found! \nAdd a Category to get started.',
                                textAlign: TextAlign.center,
                                style: CustomText(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  letterSpacing: 1,
                                  color: app.color.darkOpacity50,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1,
                            ),
                            itemCount: controller.listCategory.length,
                            itemBuilder: (BuildContext context, int index) {
                              final category = controller.listCategory[index];
                              return InkWell(
                                onTap: () {
                                  // Update CalculatorController with the selected category
                                  final calculatorController =
                                      Get.find<CalculatorController>();
                                  calculatorController.selectCategory(category);

                                  Get.back(); // Close modal after selection.
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: app.color.backlight,
                                        border: Border.all(
                                          color: app.color.primaryDark,
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: category.icon!.isNotEmpty
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                category.icon.toString(),
                                                fit: BoxFit.contain,
                                              ),
                                            )
                                          : null,
                                    ),
                                    const SizedBox(height: 8),
                                    Flexible(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          category.name.toString(),
                                          textAlign: TextAlign.center,
                                          style: CustomText(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            letterSpacing: 1,
                                            color: app.dark.lightCharcoal,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
