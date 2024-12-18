import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustTextfield extends StatelessWidget with Application {
  CustTextfield({
    super.key,
    this.control,
    required this.labeltext,
    required this.isPassword,
    this.onPressed,
    this.togglePasswordVisibility,
    this.validator,
    this.IconSufix,
    this.iconData,
    this.isPasswordVisible = false,
    this.readOnly = false,
    this.isPhone = false,
    this.ontap,
  });

  final TextEditingController? control;
  final String labeltext;
  final IconData? iconData;
  final IconData? IconSufix;
  final Function? onPressed;
  final VoidCallback? togglePasswordVisibility;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool isPasswordVisible;
  final bool isPassword;
  final bool isPhone;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    final custBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: dark.lightCharcoal, width: 1.5));
    return TextFormField(
      onTap: ontap,
      readOnly: readOnly,
      controller: control,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      obscureText: isPassword && !isPasswordVisible,
      decoration: InputDecoration(
        hintText: labeltext,
        hintStyle: CustomText(
            context: context,
            color: dark.lightCharcoal.withOpacity(0.7),
            fontSize: 15,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.15,
            fontFamily: GoogleFonts.poppins().fontFamily!),
        filled: true,
        fillColor: color.white,
        prefixIcon: Icon(
          iconData,
          color: color.primary,
          size: 25,
        ),
        enabledBorder: custBorder,
        border: custBorder,
        focusedBorder: custBorder,
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: togglePasswordVisibility,
              )
            : null,
      ),
      validator: validator,
    );
  }
}
