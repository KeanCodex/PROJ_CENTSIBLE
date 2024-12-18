import 'package:censible_app/controllers/PAGE/category_controller.dart';
import 'package:censible_app/model/CATEGORY/category_model.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustCategoryModal extends StatefulWidget {
  final CategoryModel? category;
  final bool? isEdit;
  final int? index;

  CustCategoryModal({super.key, this.category, this.isEdit, this.index});

  @override
  _CustCategoryModalState createState() => _CustCategoryModalState();
}

class _CustCategoryModalState extends State<CustCategoryModal>
    with Application {
  @override
  void initState() {
    super.initState();
    final control = Get.find<CategoryController>();

    // Use WidgetsBinding to ensure the state update occurs after the current frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Pre-fill data if editing
      if (widget.isEdit ?? false) {
        control.nameController.text = widget.category!.name.toString();
        control.selectedImageIndex =
            control.images.indexOf(widget.category!.icon!);
        control.selectedType = widget.category!.type ??
            'INCOME'; // Set the selectedType based on the category type
      } else {
        // Ensure defaults for new category creation
        control.nameController.text = '';
        control.selectedImageIndex = -1;
        control.selectedType = 'INCOME'; // Default type for new categories
      }

      // Trigger a rebuild
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CategoryController(),
      builder: (control) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: color.white,
                    border: Border.all(color: color.primaryDark, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    )),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        widget.isEdit ?? false
                            ? 'Edit Category'.toUpperCase()
                            : 'Add new category'.toUpperCase(),
                        style: CustomText(
                            context: context,
                            color: color.primaryDark,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            fontFamily: GoogleFonts.poppins().fontFamily!),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Text(
                          'Type: ',
                          style: CustomText(
                              context: context,
                              color: color.primaryDark,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.15,
                              fontFamily: GoogleFonts.poppins().fontFamily!),
                          textAlign: TextAlign.center,
                        ),
                        const Gap(10),
                        TextButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            control.selectedType = 'INCOME';
                          },
                          child: Row(
                            children: [
                              control.selectedType == 'INCOME'
                                  ? Icon(Icons.check, color: color.primaryDark)
                                  : Container(),
                              Text(
                                'INCOME',
                                style: CustomText(
                                  context: context,
                                  color: control.selectedType == 'INCOME'
                                      ? color.primaryDark
                                      : color.primaryDark.withOpacity(0.5),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.poppins().fontFamily!,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(5),
                        TextButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            control.selectedType = 'EXPENSE';
                          },
                          child: Row(
                            children: [
                              control.selectedType == 'EXPENSE'
                                  ? Icon(Icons.check, color: color.primaryDark)
                                  : Container(),
                              Text(
                                'EXPENSE',
                                style: CustomText(
                                    context: context,
                                    color: control.selectedType == 'EXPENSE'
                                        ? color.primaryDark
                                        : color.primaryDark.withOpacity(0.5),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily!),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        Text(
                          'Name: ',
                          style: CustomText(
                              context: context,
                              color: color.primaryDark,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.15,
                              fontFamily: GoogleFonts.poppins().fontFamily!),
                          textAlign: TextAlign.center,
                        ),
                        const Gap(10),
                        Expanded(
                          child: TextFormField(
                            style: CustomText(
                                context: context,
                                color: color.primaryDark.withOpacity(0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.15,
                                fontFamily: GoogleFonts.poppins().fontFamily!),
                            controller: control.nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Untitled',
                              hintStyle: CustomText(
                                  context: context,
                                  color: dark.lightCharcoal.withOpacity(0.7),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.15,
                                  fontFamily:
                                      GoogleFonts.poppins().fontFamily!),
                              filled: true,
                              contentPadding: const EdgeInsets.all(10),
                              isDense: true,
                              fillColor: color.backlight,
                              enabledBorder: control.custBorder,
                              border: control.custBorder,
                              focusedBorder: control.custBorder,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Gap(10),
                    Text(
                      'Icons: ',
                      style: CustomText(
                          context: context,
                          color: color.primaryDark,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.15,
                          fontFamily: GoogleFonts.poppins().fontFamily!),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(10),
                    Container(
                      height: 70,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: color.primarylight,
                        border:
                            Border.all(color: color.primaryDark, width: 1.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: control.images.asMap().entries.map((entry) {
                            int index = entry.key;
                            String image = entry.value;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  control.selectedImageIndex = index;
                                });
                                // Debugging print statement to confirm if the index is being updated
                                print(
                                    "Selected Index: ${control.selectedImageIndex}");
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: control.selectedImageIndex == index
                                        ? color
                                            .primaryDark // Highlight selected icon with border color
                                        : Colors
                                            .transparent, // Transparent for unselected
                                    width: control.selectedImageIndex == index
                                        ? 4
                                        : 1, // Wider border for selected
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Material(
                                  color: color.white,
                                  borderRadius: BorderRadius.circular(5),
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Image.asset(
                                      image,
                                      height: 40,
                                      width: 45,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 10),
                            backgroundColor: color.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: color.primaryDark, width: 2),
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'CANCEL',
                            textAlign: TextAlign.center,
                            style: CustomText(
                                context: context,
                                color: color.primaryDark,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.15,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily!),
                          ),
                        ),
                        const SizedBox(width: 20),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 10),
                            backgroundColor: color.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: color.primaryDark, width: 2),
                            ),
                          ),
                          onPressed: () => widget.isEdit ?? false
                              ? control.editCategoryCard(widget.index!, context)
                              : control.createCategoryCard(context),
                          child: Text(
                            widget.isEdit ?? false ? 'UPDATE' : 'SAVE',
                            textAlign: TextAlign.center,
                            style: CustomText(
                                context: context,
                                color: color.primaryDark,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.15,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily!),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showCreateCategoryCard(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustCategoryModal();
    },
  );
}

void showEditCategoryCard(
    BuildContext context, CategoryModel? category, bool isEdit, int index) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustCategoryModal(
          category: category, isEdit: isEdit, index: index);
    },
  );
}
