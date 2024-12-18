import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> with Application {
  DateTime _currentDate = DateTime(2024, 12);

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Material(
            elevation: 5,
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color.peach,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Left Arrow Button
                                IconButton(
                                  icon: const Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      size: 16),
                                  onPressed: () {
                                    _previousMonth();
                                  },
                                ),
                                // Date Text in the Center
                                Text(
                                  DateFormat('MMMM, yyyy').format(_currentDate),
                                  style: CustomText(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    letterSpacing: 2,
                                    color: dark.lightCharcoal,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                // Right Arrow Button
                                IconButton(
                                  icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 16),
                                  onPressed: () {
                                    _nextMonth();
                                  },
                                ),
                              ],
                            ),
                          ),
                          // Filter Button Right-Aligned
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: const Icon(Icons.filter_list, size: 20),
                              onPressed: () {
                                // Add your filter functionality here
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'EXPENSE',
                            style: CustomText(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 2,
                              color: dark.lightCharcoal,
                            ),
                          ),
                          Text(
                            '\$ 25.00',
                            style: CustomText(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 2,
                              color: dark.lightCharcoal,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'INCOME',
                            style: CustomText(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 2,
                              color: dark.lightCharcoal,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            '\$ 15.00',
                            style: CustomText(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 2,
                              color: dark.lightCharcoal,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'TOTAL',
                            style: CustomText(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 2,
                              color: dark.lightCharcoal,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            '\$ 40.00',
                            style: CustomText(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              letterSpacing: 2,
                              color: dark.lightCharcoal,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ],
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
