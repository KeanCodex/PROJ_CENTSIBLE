import 'package:censible_app/controllers/START/setcurrency_controller.dart';
import 'package:censible_app/data/currency_data.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SetcurrencyScreen extends StatefulWidget {
  const SetcurrencyScreen({super.key});

  @override
  State<SetcurrencyScreen> createState() => _SetcurrencyScreenState();
}

class _SetcurrencyScreenState extends State<SetcurrencyScreen>
    with Application {
  // List of currencies and their ISO codes
  final SetcurrencyController Control = Get.put(SetcurrencyController());

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
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "SET",
                        style: CustomText(
                            context: context,
                            color: dark.lightCharcoal,
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.15,
                            fontFamily: GoogleFonts.varelaRound().fontFamily!),
                      ),
                      TextSpan(
                        text: " CURRENCY",
                        style: CustomText(
                            context: context,
                            color: color.primary,
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.15,
                            fontFamily: GoogleFonts.varelaRound().fontFamily!),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                Text(
                  "◘ Choose your currency to get started",
                  style: CustomText(
                      context: context,
                      color: dark.lightCharcoal,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.15,
                      fontFamily: GoogleFonts.poppins().fontFamily!),
                ),
                const Gap(10),
                Divider(
                  color: dark.lightCharcoal,
                  thickness: 2,
                ),
                Container(
                  width: double.infinity,
                  height: 500,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    itemCount: currencies.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        elevation: 3,
                        child: ListTile(
                          leading: Checkbox(
                            activeColor: color.primary,
                            value: Control.selectedCurrencyIndex == index,
                            onChanged: (value) {
                              setState(() {
                                Control.selectedCurrencyIndex =
                                    value! ? index : -1;
                              });
                            },
                          ),
                          title: Text(
                            currencies[index]['Currency']!,
                            style: CustomText(
                              context: context,
                              color: dark.lightCharcoal,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.15,
                              fontFamily: GoogleFonts.poppins().fontFamily!,
                            ),
                          ),
                          subtitle: Text(
                            '${currencies[index]['Code']!} - ${currencies[index]['Symbol']!} ${currencies[index]['Value'].toString()}',
                            style: CustomText(
                              context: context,
                              color: dark.lightCharcoal.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.15,
                              fontFamily: GoogleFonts.roboto().fontFamily!,
                            ),
                          ),
                          trailing: Text(
                            currencies[index]['Code'].toString(),
                            style: CustomText(
                              context: context,
                              color: dark.lightCharcoal,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.15,
                              fontFamily: GoogleFonts.poppins().fontFamily!,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              Control.selectedCurrencyIndex = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  color: dark.lightCharcoal,
                  thickness: 2,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: color.primary,
                    ),
                    Text(
                      " you can also import your saved currencies",
                      style: CustomText(
                          context: context,
                          color: dark.lightCharcoal,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.15,
                          fontFamily: GoogleFonts.poppins().fontFamily!),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const Gap(30),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(color.primary.withOpacity(1)),
                      elevation: const WidgetStatePropertyAll(3),
                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              side: BorderSide(color: color.white, width: 3),
                              borderRadius: BorderRadius.circular(8)))),
                  onPressed: () => Control.validateCurrencySelection(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SAVED CURRENCY',
                          textAlign: TextAlign.center,
                          style: style.buttonText(context,
                              color: color.white, fontspace: 1.5, fontsize: 17),
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
