import 'package:censible_app/routes/screen_routes.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> with Application {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "CENT",
                        style: CustomText(
                            context: context,
                            color: dark.lightCharcoal,
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.15,
                            fontFamily: GoogleFonts.varelaRound().fontFamily!),
                      ),
                      TextSpan(
                        text: "SIBLE",
                        style: CustomText(
                            context: context,
                            color: color.primary,
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.15,
                            fontFamily: GoogleFonts.varelaRound().fontFamily!),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Divider(
                  color: dark.lightCharcoal,
                  thickness: 2,
                ),
                Image.asset(
                  image.STARTED_BACK,
                  fit: BoxFit.cover,
                  scale: 0.8,
                ),
                Divider(
                  color: dark.lightCharcoal,
                  thickness: 2,
                ),
                Text.rich(
                  textAlign: TextAlign.justify,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "◘ Track your spending with ease using Centsible",
                        style: CustomText(
                            context: context,
                            color: dark.lightCharcoal,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.15,
                            fontFamily: GoogleFonts.poppins().fontFamily!),
                      ),
                      TextSpan(
                        text: " – the smart way to manage your expenses.",
                        style: CustomText(
                            context: context,
                            color: color.primary,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.15,
                            fontFamily: GoogleFonts.poppins().fontFamily!),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                SlideAction(
                  textColor: color.white,
                  outerColor: color.darkOpacity60,
                  borderRadius: 15,
                  onSubmit: () =>
                      Get.toNamed(ScreenRouter.getWalkThruscreenRoute),
                  innerColor: color.primary,
                  elevation: 3,
                  child: Text(
                    "Slide to continue",
                    style: CustomText(
                        context: context,
                        color: color.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.25,
                        fontFamily: GoogleFonts.poppins().fontFamily!),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
