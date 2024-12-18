import 'package:censible_app/components/element/cust_textfield.dart';
import 'package:censible_app/controllers/AUTH/signin_controller.dart';
import 'package:censible_app/routes/screen_routes.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget with Application {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SigninController(),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
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
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.primary.withOpacity(0.2),
                      color.primary.withOpacity(0.5),
                      color.primary.withOpacity(0.8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 35),
                      child: Row(
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(5),
                            elevation: 3,
                            child: InkWell(
                              onTap: () => Get.toNamed(
                                  ScreenRouter.getSelectAuthScreenRoute),
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
                          const Spacer(),
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
                                          fontFamily: GoogleFonts.varelaRound()
                                              .fontFamily!),
                                    ),
                                    TextSpan(
                                      text: "SIBLE",
                                      style: CustomText(
                                          context: context,
                                          color: color.primary,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.15,
                                          fontFamily: GoogleFonts.varelaRound()
                                              .fontFamily!),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(icon.LOGO, scale: 2.5),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.70,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: CustomText(
                            context: context,
                            color: color.primary,
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                            fontFamily: GoogleFonts.poppins().fontFamily!),
                      ),
                      const Gap(10),
                      Text(
                        'Welcome Back to centsible',
                        textAlign: TextAlign.center,
                        style: CustomText(
                            context: context,
                            color: dark.lightCharcoal,
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                            fontFamily: GoogleFonts.poppins().fontFamily!),
                      ),
                      const Gap(30),
                      //Email
                      CustTextfield(
                        control: controller.emailController,
                        labeltext: 'Email',
                        iconData: Icons.email_outlined,
                        isPassword: false,
                      ),
                      const Gap(20),

                      //Password
                      CustTextfield(
                        control: controller.passwordController,
                        labeltext: 'Password',
                        iconData: Icons.lock_outline_rounded,
                        isPassword: true,
                        isPasswordVisible: controller.isPasswordVisible,
                        togglePasswordVisibility:
                            controller.togglePasswordVisibility,
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password?",
                            style: CustomText(
                                context: context,
                                color: dark.lightCharcoal,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.15,
                                fontFamily: GoogleFonts.poppins().fontFamily!),
                          ),
                        ],
                      ),
                      const Gap(20),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(color.primary),
                            elevation: const WidgetStatePropertyAll(3),
                            shape:
                                WidgetStatePropertyAll<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        side:
                                            BorderSide(
                                                color: color.white, width: 3),
                                        borderRadius:
                                            BorderRadius.circular(8)))),
                        onPressed: () =>
                            controller.toSignInConfirm(context), //signin
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
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
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily!),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Divider(
                                    thickness: 1, color: dark.lightCharcoal)),
                            const Gap(5),
                            Text(
                              'or with',
                              textAlign: TextAlign.center,
                              style: CustomText(
                                  context: context,
                                  color: color.primary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                  fontFamily:
                                      GoogleFonts.poppins().fontFamily!),
                            ),
                            const Gap(5),
                            Expanded(
                                child: Divider(
                                    thickness: 1, color: dark.lightCharcoal)),
                          ],
                        ),
                      ),
                      const Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () =>
                                controller.signInWithGoogle(context, 'signin'),
                            child: Material(
                              color: color.white,
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: color.white, width: 2)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80, vertical: 15),
                                  child: Row(
                                    children: [
                                      Image.asset(icon.GOOGLE, scale: 17),
                                      const Gap(20),
                                      Text(
                                        'Sign in with Google',
                                        style: CustomText(
                                            context: context,
                                            color: dark.lightCharcoal,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 0.15,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily!),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Gap(50),
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: CustomText(
                                  context: context,
                                  color: dark.lightCharcoal,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.15,
                                  fontFamily:
                                      GoogleFonts.poppins().fontFamily!),
                            ),
                            TextSpan(
                              text: "register",
                              style: CustomText(
                                context: context,
                                color: color.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.15,
                                fontFamily: GoogleFonts.poppins().fontFamily!,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed(
                                    ScreenRouter.getSignupScreenRoute),
                            )
                          ],
                        ),
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
}
