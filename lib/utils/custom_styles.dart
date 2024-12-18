import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin class CustomTextStyle {
  TextStyle displayLarge(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.inter(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        letterSpacing: .5,
        fontSize: 34,
      ),
    );
  }

  TextStyle displayMedium(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.8,
        fontSize: 26,
      ),
    );
  }

  TextStyle displaySmall(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        fontSize: 24,
      ),
    );
  }

  TextStyle headlineLarge(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        fontSize: 22,
      ),
    );
  }

  TextStyle headlineMedium(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
        fontSize: 20,
      ),
    );
  }

  TextStyle headlineSmall(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.8,
        fontSize: 18,
      ),
    );
  }

  TextStyle titleLarge(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.9,
        fontSize: 18,
      ),
    );
  }

  TextStyle titleMedium(BuildContext context,
      {Color color = const Color(0xFF18988B),
      FontWeight Fontweight = FontWeight.w500}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: color,
        fontWeight: Fontweight,
        letterSpacing: 0.5,
        fontSize: 15,
      ),
    );
  }

  TextStyle titleSmall(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.7,
        fontSize: 14,
      ),
    );
  }

  TextStyle labelLarge(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        fontSize: 14,
      ),
    );
  }

  TextStyle labelMedium(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
        fontSize: 12,
      ),
    );
  }

  TextStyle labelSmall(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.7,
        fontSize: 10,
      ),
    );
  }

  TextStyle bodyLarge(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
        fontSize: 16,
      ),
    );
  }

  TextStyle bodyMedium(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.8,
        fontSize: 14,
      ),
    );
  }

  TextStyle bodySmall(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.7,
        fontSize: 12,
      ),
    );
  }

  TextStyle captionLarge(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        fontSize: 12,
      ),
    );
  }

  TextStyle captionMedium(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
        fontSize: 10,
      ),
    );
  }

  TextStyle captionSmall(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w200,
        fontStyle: FontStyle.italic,
        fontSize: 8,
      ),
    );
  }

  TextStyle footerLarge(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
    );
  }

  TextStyle footerSmall(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 10,
      ),
    );
  }

  TextStyle overlineLarge(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 10,
        letterSpacing: 1.2,
      ),
    );
  }

  TextStyle overlineSmall(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 8,
        letterSpacing: 1,
      ),
    );
  }

  TextStyle calloutBold(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    );
  }

  TextStyle calloutRegular(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    );
  }

  TextStyle quoteLarge(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }

  TextStyle quoteSmall(BuildContext context,
      {Color color = const Color(0xFF18988B)}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );
  }

  TextStyle buttonText(
    BuildContext context, {
    Color color = Colors.black,
    double? fontsize = 15,
    double? fontspace,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        letterSpacing: fontspace,
        height: 1.5,
        fontSize: fontsize,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TextStyle TitleLarge(BuildContext context, {Color color = Colors.black}) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.5,
        fontSize: 18,
      ),
    );
  }
}

//# CUSTOMIZED TEXT STYLE
TextStyle CustomText({
  BuildContext? context,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  double? letterSpacing,
  String? fontFamily,
}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily);
}

mixin class CustomButtonStyle {
  ButtonStyle button1({
    Size size = const Size(30, 30),
    double borderWidth = 1.0,
    Color backgroundColor = const Color(0x6A683AB7),
    Color borderColor = Colors.deepPurple,
    double radius = 1,
    Color overlayColor = Colors.white38,
  }) {
    return ButtonStyle(
      overlayColor: MaterialStatePropertyAll(overlayColor),
      fixedSize: MaterialStatePropertyAll(size),
      backgroundColor: MaterialStatePropertyAll(backgroundColor),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
    );
  }
}

mixin class AlertDisplay {
  void alertDisplay(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          titlePadding: const EdgeInsets.all(16),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          backgroundColor: Colors.white,
          title: const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.check_circle,
              size: 48,
              color: Colors.green,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(text),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("OK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

mixin class CustBorder {
  InputBorder custborder(BuildContext context,
      {Color color = Colors.black, double width = 1, double radius = 10}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
