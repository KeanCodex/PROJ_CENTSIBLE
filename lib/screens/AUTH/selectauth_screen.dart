import 'package:censible_app/routes/screen_routes.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthSelectScreen extends StatefulWidget {
  const AuthSelectScreen({super.key});

  @override
  State<AuthSelectScreen> createState() => _AuthSelectScreenState();
}

class _AuthSelectScreenState extends State<AuthSelectScreen> with Application {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: Row(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(5),
                    elevation: 3,
                    child: InkWell(
                      onTap: () =>
                          Get.toNamed(ScreenRouter.getWalkThruscreenRoute),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: color.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(Icons.arrow_back_rounded,
                              color: color.primary),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Image.asset(
                        icon.LOGO,
                        scale: 9,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "CENT",
                              style: CustomText(
                                  context: context,
                                  color: dark.lightCharcoal,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.15,
                                  fontFamily:
                                      GoogleFonts.varelaRound().fontFamily!),
                            ),
                            TextSpan(
                              text: "SIBLE",
                              style: CustomText(
                                  context: context,
                                  color: color.primary,
                                  fontSize: 17,
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
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(80),
                Image.asset(
                  icon.PHONE,
                  fit: BoxFit.cover,
                  scale: 1.5,
                ),
                const Gap(50),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Track your spending securely with Centsible",
                        style: CustomText(
                            context: context,
                            color: dark.lightCharcoal,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.15,
                            fontFamily: GoogleFonts.poppins().fontFamily!),
                      ),
                      TextSpan(
                        text:
                            " – the smart way to manage your expenses while keeping your data safe.",
                        style: CustomText(
                            context: context,
                            color: color.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.15,
                            fontFamily: GoogleFonts.poppins().fontFamily!),
                      ),
                    ],
                  ),
                ),
                const Gap(40),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(color.primary),
                      elevation: const WidgetStatePropertyAll(3),
                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: BorderSide(color: color.white, width: 3),
                              borderRadius: BorderRadius.circular(8)))),
                  onPressed: () async {
                    await Get.toNamed(
                        ScreenRouter.getSigninScreenRoute); //signin
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'LOGIN',
                          textAlign: TextAlign.center,
                          style: CustomText(
                              context: context,
                              color: color.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                              fontFamily: GoogleFonts.poppins().fontFamily!),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(15),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          dark.lightCharcoal.withOpacity(0.7)),
                      elevation: const WidgetStatePropertyAll(3),
                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: BorderSide(color: color.white, width: 3),
                              borderRadius: BorderRadius.circular(8)))),
                  onPressed: () async {
                    await Get.toNamed(
                        ScreenRouter.getSignupScreenRoute); //signup
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'REGISTER',
                          textAlign: TextAlign.center,
                          style: CustomText(
                              context: context,
                              color: color.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                              fontFamily: GoogleFonts.poppins().fontFamily!),
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
    );
  }
}
