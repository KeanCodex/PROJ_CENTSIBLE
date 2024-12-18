import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustLoadingcard extends StatefulWidget {
  CustLoadingcard({
    super.key,
  });

  @override
  _CustLoadingcardState createState() => _CustLoadingcardState();
}

class _CustLoadingcardState extends State<CustLoadingcard> with Application {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: color.primaryDark, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                      gif.LOADING,
                      fit: BoxFit.contain,
                      scale: 4,
                    ),
                  ),
                  const Gap(10),
                  Divider(color: color.darkOpacity50, thickness: 2),
                  const Gap(10),
                  Text(
                    "Loading Data...",
                    textAlign: TextAlign.center,
                    style: CustomText(
                        context: context,
                        color: color.primaryDark,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.15,
                        fontFamily: GoogleFonts.montserrat().fontFamily!),
                  ),
                  const Gap(10),
                  Text(
                    "Please wait while we fetch your data from the server and display it to you on the screen.",
                    style: CustomText(
                        context: context,
                        color: color.primaryDark,
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.15,
                        fontFamily: GoogleFonts.montserrat().fontFamily!),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Usage example somewhere in your app:
void showCustLoadingcard(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustLoadingcard();
    },
  );
}
