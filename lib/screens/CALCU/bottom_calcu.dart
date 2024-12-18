import 'package:censible_app/controllers/CALCU/calculator_controller.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BottomCalcu extends StatefulWidget {
  BottomCalcu({super.key});

  @override
  State<BottomCalcu> createState() => _BottomCalcuState();
}

class _BottomCalcuState extends State<BottomCalcu> with Application {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CalculatorController(),
      builder: (ctrl) => Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: color.primarylight,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          side: BorderSide(color: color.primaryDark, width: 2),
                        ),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () =>
                          ctrl.pickDate(context), // Trigger the date picker
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('MMMM dd, yyyy')
                                .format(DateTime.parse(ctrl.selectedDate)),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 1,
                              color: color.primaryDark,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: color.primarylight,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          side: BorderSide(color: color.primaryDark, width: 2),
                        ),
                        padding: EdgeInsets.all(15),
                      ),
                      onPressed: () =>
                          ctrl.pickTime(context), // Trigger the time picker
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ctrl.selectedTime, // Display the selected time
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 1,
                              color: color.primaryDark,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
