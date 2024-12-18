import 'package:censible_app/components/mod/cust_account_modal.dart';
import 'package:censible_app/components/validation/cust_delete.dart';
import 'package:censible_app/controllers/PAGE/account_controller.dart';
import 'package:censible_app/controllers/PAGE/records_controller.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  _RecordsScreenState createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> with Application {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RecordsController(),
      builder: (controller) => Scaffold(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Left Arrow Button
                                      IconButton(
                                        icon: const Icon(
                                            Icons.arrow_back_ios_new_outlined,
                                            size: 16),
                                        onPressed: () {
                                          controller.previousMonth();
                                        },
                                      ),
                                      // Date Text in the Center
                                      Text(
                                        DateFormat('MMMM, yyyy')
                                            .format(controller.currentDate),
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
                                          controller.nextMonth();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                // Filter Button Right-Aligned
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon:
                                        const Icon(Icons.filter_list, size: 20),
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
                                  '\$${controller.totalExpenses.value}',
                                  style: CustomText(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    letterSpacing: 2,
                                    color: dark.lightCharcoal,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
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
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                                Text(
                                  '\$ ${controller.totalIncome.value}',
                                  style: CustomText(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    letterSpacing: 2,
                                    color: dark.lightCharcoal,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
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
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                                Obx(() {
                                  return Text(
                                    '${controller.totalBalance.value < 0 ? '-' : ''}\$${controller.totalBalance.value.abs()}',
                                    style: CustomText(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      letterSpacing: 2,
                                      color: dark.lightCharcoal,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                    ),
                                  );
                                })
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        '${DateFormat('MMMM').format(DateTime(controller.currentDate.year, controller.currentDate.month))}, ${DateFormat('EEEE').format(
                          DateTime(controller.currentDate.year,
                              controller.currentDate.month),
                        )}',
                        style: CustomText(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: 1.3,
                          color: color.primaryDark,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: color.primaryDark,
                      thickness: 2,
                    )),
                Obx(
                  () {
                    return controller.listRecords.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    gif.NO_DATA,
                                    fit: BoxFit.contain,
                                    scale: 3,
                                  ),
                                  Text(
                                    'No records in this month.\nTap + to add new expense or income.',
                                    textAlign: TextAlign.center,
                                    style: CustomText(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      letterSpacing: 1,
                                      color: color.darkOpacity50,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ListView.builder(
                                itemCount: controller.listRecords.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final record = controller.listRecords[index];
                                  return Card(
                                    color: color.primarylight,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: color.primaryDark, width: 1.5),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 55,
                                            width: 55,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: color.primaryDark,
                                                width: 2,
                                              ),
                                              color: color.backlight,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                            ),
                                            child: record.account!.icon != null
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.asset(
                                                      record.category!.icon
                                                          .toString(),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              record.category!.name.toString(),
                                              style: CustomText(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                letterSpacing: 2,
                                                color: color.primaryDark,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  child: Container(
                                                    height: 23,
                                                    width: 28,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            color.primaryDark,
                                                        width: 2,
                                                      ),
                                                      color: color.backlight,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  3)),
                                                    ),
                                                    child: record.account!
                                                                .icon !=
                                                            null
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(1),
                                                            child: Image.asset(
                                                              record
                                                                  .account!.icon
                                                                  .toString(),
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                ),
                                                Text(
                                                  record.account!.name
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: CustomText(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    letterSpacing: 2,
                                                    color: dark.lightCharcoal,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            record.type == 'EXPENSE'
                                                ? '-\$${record.inputValue}'
                                                : '\$${record.inputValue}',
                                            style: CustomText(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              letterSpacing: 2,
                                              color: color.primaryDark,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
