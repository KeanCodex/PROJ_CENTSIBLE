import 'package:censible_app/controllers/SPLASH/splash_controller.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget with Application {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) => Scaffold(
          body: Stack(
            fit: StackFit.loose,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    image.SPLASH_BACK,
                  ),
                  fit: BoxFit.cover,
                )),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                        elevation: 7,
                        borderRadius: BorderRadius.circular(10),
                        color: color.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 15),
                          child: Image.asset(
                            icon.LOGO,
                            scale: 4,
                          ),
                        )),
                    const SizedBox(height: 18),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "CENT",
                            style: CustomText(
                                context: context,
                                color: color.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.15,
                                fontFamily:
                                    GoogleFonts.varelaRound().fontFamily!),
                          ),
                          TextSpan(
                            text: "SIBLE",
                            style: CustomText(
                                context: context,
                                color: dark.lightCharcoal,
                                fontSize: 35,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.15,
                                fontFamily:
                                    GoogleFonts.varelaRound().fontFamily!),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 25,
                right: 0,
                left: 0,
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "2025 Centsible",
                          style: CustomText(
                              context: context,
                              color: color.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.15,
                              fontFamily: GoogleFonts.montserrat().fontFamily!),
                        ),
                        TextSpan(
                          text: " All rights reserved.",
                          style: CustomText(
                              context: context,
                              color: dark.lightCharcoal,
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.15,
                              fontFamily: GoogleFonts.montserrat().fontFamily!),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
