import 'package:censible_app/components/element/cust_textfield.dart';
import 'package:censible_app/controllers/AUTH/signin_controller.dart';
import 'package:censible_app/controllers/AUTH/signup_controller.dart';
import 'package:censible_app/routes/screen_routes.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatelessWidget with Application {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SignupController(),
        builder: (controller) {
          return Scaffold(
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
                    height: MediaQuery.of(context).size.height * 0.20,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                    onTap: () => Get.back(),
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
                                                fontFamily:
                                                    GoogleFonts.varelaRound()
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
                                                fontFamily:
                                                    GoogleFonts.varelaRound()
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
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.90,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'REGISTER',
                              textAlign: TextAlign.center,
                              style: CustomText(
                                  context: context,
                                  color: color.primary,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1,
                                  fontFamily:
                                      GoogleFonts.poppins().fontFamily!),
                            ),
                            Text(
                              'Create an account to continue',
                              textAlign: TextAlign.center,
                              style: CustomText(
                                  context: context,
                                  color: dark.lightCharcoal,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1,
                                  fontFamily:
                                      GoogleFonts.poppins().fontFamily!),
                            ),
                            const Gap(40),
                            //Full Name
                            CustTextfield(
                              control: controller.nameController,
                              labeltext: 'Full Name',
                              iconData: Icons.person_outline_rounded,
                              isPassword: false,
                            ),
                            const Gap(20),
                            //Email
                            CustTextfield(
                              control: controller.emailController,
                              labeltext: 'Email',
                              iconData: Icons.email_outlined,
                              isPassword: false,
                            ),
                            const Gap(20),
                            //Phone
                            CustTextfield(
                              control: controller.phoneController,
                              labeltext: 'Phone (+09)',
                              iconData: Icons.call_outlined,
                              isPassword: false,
                              isPhone: true,
                            ),
                            const Gap(20),
                            //Address
                            CustTextfield(
                              control: controller.addressController,
                              labeltext: 'Address',
                              iconData: Icons.map_outlined,
                              isPassword: false,
                            ),
                            const Gap(20),
                            //Birthdate
                            CustTextfield(
                              control: controller.birthDateController,
                              labeltext: 'Birth Date',
                              iconData: Icons.calendar_month_outlined,
                              isPassword: false,
                              readOnly: true,
                              ontap: () async {
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: color.primary,
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (picked != null) {
                                  controller.birthDateController.text =
                                      DateFormat('MMMM, dd yyyy')
                                          .format(picked);
                                }
                              },
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
                            //Password

                            CustTextfield(
                              control: controller.confirmPasswordController,
                              labeltext: 'Confirm Password',
                              iconData: Icons.lock_outline_rounded,
                              isPassword: true,
                              isPasswordVisible:
                                  controller.isConfirmPasswordVisible,
                              togglePasswordVisibility:
                                  controller.toggleConfirmPasswordVisibility,
                            ),
                            const Gap(20),

                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(color.primary),
                                  elevation: const WidgetStatePropertyAll(3),
                                  shape: WidgetStatePropertyAll<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: color.white, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(8)))),
                              onPressed: () =>
                                  controller.toSignUpConfirm(context), //signin

                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
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
                                          fontFamily: GoogleFonts.poppins()
                                              .fontFamily!),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const Gap(30),

                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Already have an account? ",
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
                                    text: "login",
                                    style: CustomText(
                                      context: context,
                                      color: color.primary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 0.15,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily!,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Get.toNamed(
                                          ScreenRouter.getSigninScreenRoute),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
