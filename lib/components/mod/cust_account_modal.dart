import 'package:censible_app/controllers/PAGE/account_controller.dart';
import 'package:censible_app/model/ACCOUNT/account_model.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountCard extends StatefulWidget {
  final AccountModel? account;
  final bool? isEdit;
  final int? index;

  CreateAccountCard({super.key, this.account, this.isEdit, this.index});

  @override
  _CreateAccountCardState createState() => _CreateAccountCardState();
}

class _CreateAccountCardState extends State<CreateAccountCard>
    with Application {
  void initState() {
    super.initState();
    final control = Get.find<AccountController>();

    // Pre-fill data if editing
    if (widget.isEdit ?? false) {
      control.amountController.text = widget.account!.amount.toString();
      control.nameController.text = widget.account!.name.toString();
      control.selectedImageIndex =
          control.images.indexOf(widget.account!.icon!);
    } else {
      // Ensure defaults for new account creation
      control.amountController.text = '';
      control.nameController.text = '';
      control.selectedImageIndex = -1;
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AccountController(),
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
                            ? 'Edit Account'.toUpperCase()
                            : 'Add New Account'.toUpperCase(),
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
                          'Amount: ',
                          style: CustomText(
                              context: context,
                              color: color.primaryDark,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.15,
                              fontFamily: GoogleFonts.poppins().fontFamily!),
                          textAlign: TextAlign.center,
                        ),
                        const Gap(20),
                        Expanded(
                          child: TextFormField(
                            style: CustomText(
                                context: context,
                                color: color.primaryDark.withOpacity(0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.15,
                                fontFamily: GoogleFonts.poppins().fontFamily!),
                            controller: control.amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Amount',
                              hintStyle: CustomText(
                                  context: context,
                                  color: dark.lightCharcoal.withOpacity(0.7),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.15,
                                  fontFamily:
                                      GoogleFonts.poppins().fontFamily!),
                              filled: true,
                              contentPadding: const EdgeInsets.all(9),
                              isDense: true,
                              fillColor: color.backlight,
                              enabledBorder: control.custBorder,
                              border: control.custBorder,
                              focusedBorder: control.custBorder,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(5),
                    Text(
                      '*Initial amount will not be reflected in analysis',
                      style: CustomText(
                          context: context,
                          color: dark.lightCharcoal,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.15,
                          fontFamily: GoogleFonts.montserrat().fontFamily!),
                      textAlign: TextAlign.start,
                    ),
                    const Gap(10),
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
                              contentPadding: const EdgeInsets.all(9),
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
                              ? control.editAccountCard(widget.index!, context)
                              : control.createAccountCard(context),
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

void showCreateAccountCard(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CreateAccountCard();
    },
  );
}

void showEditAccountCard(
    BuildContext context, AccountModel? account, bool isEdit, int index) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CreateAccountCard(account: account, isEdit: isEdit, index: index);
    },
  );
}
