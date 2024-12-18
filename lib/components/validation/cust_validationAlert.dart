import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ValidationAlert extends StatefulWidget {
  final String title;
  final String text;
  final bool isValid;
  final VoidCallback onpress;

  ValidationAlert(
      {super.key,
      required this.title,
      required this.text,
      required this.isValid,
      required this.onpress});

  @override
  _ValidationAlertState createState() => _ValidationAlertState();
}

class _ValidationAlertState extends State<ValidationAlert> with Application {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: widget.isValid ? color.primary : color.invalid,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  widget.isValid ? gif.REGISTER : gif.INVALID,
                  fit: BoxFit.contain,
                  scale: 4,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: CustomText(
                        context: context,
                        color: color.primary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.15,
                        fontFamily: GoogleFonts.montserrat().fontFamily!),
                  ),
                  const Gap(10),
                  Text(
                    widget.text,
                    style: CustomText(
                        context: context,
                        color: dark.lightCharcoal,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.15,
                        fontFamily: GoogleFonts.montserrat().fontFamily!),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              backgroundColor: widget.isValid ? color.primary : color.invalid,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: widget.onpress,
            child: Text(
              widget.isValid ? 'Continue' : 'Retry',
              textAlign: TextAlign.center,
              style: CustomText(
                  context: context,
                  color: color.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.15,
                  fontFamily: GoogleFonts.montserrat().fontFamily!),
            ),
          ),
        ),
      ],
    );
  }
}

// Usage example somewhere in your app:
void showValidationAlert(BuildContext context, String title, String text,
    String authType, bool isValid, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ValidationAlert(
        title: title,
        text: text,
        isValid: isValid,
        onpress: onConfirm,
      );
    },
  );
}
