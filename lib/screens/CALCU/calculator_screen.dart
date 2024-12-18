import 'package:censible_app/controllers/CALCU/calculator_controller.dart';
import 'package:censible_app/screens/CALCU/bottom_calcu.dart';
import 'package:censible_app/screens/CALCU/header_calcu.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> with Application {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CalculatorController(),
      builder: (ctrl) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: color.background,
        body: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    image.LIGHT_BACK,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                HeaderCalcu(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: TextField(
                    controller: ctrl.NotesController,
                    style: CustomText(
                      context: context,
                      color: color.primaryDark,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.15,
                      fontFamily: GoogleFonts.poppins().fontFamily!,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: color.backlight,
                      hintText: 'ADD NOTES',
                      hintStyle: CustomText(
                        context: context,
                        color: dark.lightCharcoal.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.15,
                        fontFamily: GoogleFonts.poppins().fontFamily!,
                      ),
                      border: ctrl.CustBorder,
                      focusedBorder: ctrl.CustBorder,
                      enabledBorder: ctrl.CustBorder,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    maxLines: 5,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    decoration: BoxDecoration(
                      color: color.white,
                      border: Border.all(color: color.primaryDark, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              ctrl.displayValue,
                              style: CustomText(
                                context: context,
                                color: color.primaryDark,
                                fontSize: 35,
                                fontWeight: FontWeight.w900,
                                fontFamily: GoogleFonts.poppins().fontFamily!,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                          ),
                          onPressed: () => ctrl.onButtonPressed("C"),
                          child: Text(
                            '\u232B',
                            style: CustomText(
                              context: context,
                              color: color.primaryDark,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontFamily: GoogleFonts.poppins().fontFamily!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: [
                      "\u00F7",
                      "7",
                      "8",
                      "9",
                      "\u00D7",
                      "4",
                      "5",
                      "6",
                      "-",
                      "1",
                      "2",
                      "3",
                      "+",
                      ".",
                      "0",
                      "=",
                    ].map((buttonText) {
                      bool isOperator = ["+", "-", "\u00D7", "\u00F7", "="]
                          .contains(buttonText);
                      return Container(
                        height: 25,
                        child: ElevatedButton(
                          onPressed: () => ctrl.onButtonPressed(buttonText),
                          style: ElevatedButton.styleFrom(
                            side:
                                BorderSide(color: color.primaryDark, width: 2),
                            backgroundColor:
                                isOperator ? color.primarylight : color.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            buttonText,
                            style: CustomText(
                              context: context,
                              color: color.primaryDark,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: GoogleFonts.poppins().fontFamily!,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 25,
              left: 0,
              right: 0,
              child: BottomCalcu(),
            ),
          ],
        ),
      ),
    );
  }
}
