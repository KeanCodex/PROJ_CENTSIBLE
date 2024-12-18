import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteValidationAlert extends StatefulWidget {
  final VoidCallback onpress;

  DeleteValidationAlert({
    super.key,
    required this.onpress,
  });

  @override
  _DeleteValidationAlertState createState() => _DeleteValidationAlertState();
}

class _DeleteValidationAlertState extends State<DeleteValidationAlert>
    with Application {
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
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: color.primary,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: color.primaryDark,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          gif.REMOVE,
                          fit: BoxFit.contain,
                          scale: 3.5,
                        ),
                      ),
                      Divider(color: color.darkOpacity50, thickness: 2),
                      const Gap(5),
                      Text(
                        "Delete this account?",
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
                        "Deleting this account will also delete all records with account. Are you sure?",
                        style: CustomText(
                            context: context,
                            color: color.primaryDark,
                            fontSize: 14.5,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.15,
                            fontFamily: GoogleFonts.montserrat().fontFamily!),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 10),
                              backgroundColor: color.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                    color: color.primaryDark, width: 2),
                              ),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              'NO',
                              textAlign: TextAlign.center,
                              style: CustomText(
                                  context: context,
                                  color: color.primaryDark,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.15,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily!),
                            ),
                          ),
                          const SizedBox(width: 20),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 10),
                              backgroundColor: color.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                    color: color.primaryDark, width: 2),
                              ),
                            ),
                            onPressed: () => widget.onpress(),
                            child: Text(
                              'YES',
                              textAlign: TextAlign.center,
                              style: CustomText(
                                  context: context,
                                  color: color.primaryDark,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.15,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily!),
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
        ],
      ),
    );
  }
}

// Usage example somewhere in your app:
void showDeleteValidationAlert(
  BuildContext context,
  VoidCallback onConfirm,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DeleteValidationAlert(
        onpress: onConfirm,
      );
    },
  );
}
