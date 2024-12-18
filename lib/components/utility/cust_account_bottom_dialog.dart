import 'package:censible_app/controllers/CALCU/calculator_controller.dart';
import 'package:censible_app/controllers/PAGE/account_controller.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

var app = Application();
Future<void> showCustomAccountModal(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: app.color.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    builder: (BuildContext context) {
      return GetBuilder<AccountController>(
        init: AccountController(),
        builder: (controller) {
          // Defer sorting logic to the next frame

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: InkWell(
                      onTap: () => Get.back(),
                      child:
                          Divider(color: app.color.primaryDark, thickness: 3)),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please select an account'.toUpperCase(),
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

                // Display accounts
                controller.listAccount.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            Image.asset(
                              app.gif.NO_DATA,
                              fit: BoxFit.contain,
                              scale: 3,
                            ),
                            Text(
                              'No Account Found! \nAdd an Account to get started.',
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
                        child: ListView.builder(
                          itemCount: controller.listAccount.length,
                          itemBuilder: (BuildContext context, int index) {
                            final account = controller.listAccount[index];
                            return InkWell(
                              onTap: () {
                                final calculatorController =
                                    Get.find<CalculatorController>();
                                calculatorController.selectAccount(account);
                                Get.back();
                              },
                              child: Card(
                                elevation: 2,
                                color: app.color.primarylight,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: app.color.primaryDark, width: 1.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 55,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          color: app.color.backlight,
                                          border: Border.all(
                                              color: app.color.primaryDark,
                                              width: 2),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: account.icon!.isNotEmpty
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                    account.icon.toString(),
                                                    fit: BoxFit.contain),
                                              )
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      account.name.toString(),
                                      style: CustomText(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        letterSpacing: 2,
                                        color: app.dark.lightCharcoal,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '\$${account.balance}',
                                      style: CustomText(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        letterSpacing: 2,
                                        color: app.dark.lightCharcoal,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          );
        },
      );
    },
  );
}
