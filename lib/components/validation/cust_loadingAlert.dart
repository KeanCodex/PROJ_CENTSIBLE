import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingAlert extends StatefulWidget {
  final String title;
  final String subtitle;

  const LoadingAlert({super.key, required this.title, required this.subtitle});

  @override
  _LoadingAlertState createState() => _LoadingAlertState();
}

class _LoadingAlertState extends State<LoadingAlert> with Application {
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
                color: color.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    gif.LOADING,
                    fit: BoxFit.contain,
                    scale: 5,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: color.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
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
                  const Gap(20),
                  Text(
                    widget.subtitle,
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
    );
  }
}

void showLoadingAlert(BuildContext context, String title, String subtitle) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return LoadingAlert(title: title, subtitle: subtitle);
    },
  );
}

void hideLoadingAlert(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
