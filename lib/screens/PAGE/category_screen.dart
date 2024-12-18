import 'package:censible_app/components/mod/cust_category_modal.dart';
import 'package:censible_app/components/validation/cust_delete.dart';
import 'package:censible_app/controllers/PAGE/category_controller.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with Application {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CategoryController(),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                "[ All Accounts \$900.00 ]",
                                style: CustomText(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  letterSpacing: 2,
                                  color: dark.lightCharcoal,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'EXPENSE SO FAR',
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
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'INCOME SO FAR',
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
                                  '\$ 15.00',
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
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          '⟁ CATEGORY LIST',
                          style: CustomText(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 1,
                            color: color.primaryDark,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => showCreateCategoryCard(context),
                        child: Material(
                          color: color.primarylight,
                          elevation: 3,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            child: Text(
                              '+',
                              style: CustomText(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                letterSpacing: 1,
                                color: color.primaryDark,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () {
                    return controller.listCategory.isEmpty
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
                                    'No Category Found! \nAdd an Category to get started.',
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
                              padding: const EdgeInsets.only(
                                  right: 15, left: 10, bottom: 100, top: 10),
                              child: ListView.builder(
                                itemCount: controller.listCategory.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final category =
                                      controller.listCategory[index];
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
                                                  width: 2),
                                              color: color.backlight,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: category.icon!.isNotEmpty
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.asset(
                                                      category.icon.toString(),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              category.name.toString(),
                                              style: CustomText(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                letterSpacing: 2,
                                                color: dark.lightCharcoal,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                              ),
                                            ),
                                            Text(
                                              category.type.toString(),
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
                                        const Spacer(),
                                        PopupMenuButton(
                                          color: color.primarylight,
                                          icon: Icon(
                                            Icons.more_vert,
                                            color: dark.lightCharcoal,
                                          ),
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: 'delete',
                                              child: Text(
                                                'Delete',
                                                style: CustomText(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  letterSpacing: 2,
                                                  color: dark.lightCharcoal,
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: 'edit',
                                              child: Text(
                                                'Edit',
                                                style: CustomText(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  letterSpacing: 2,
                                                  color: dark.lightCharcoal,
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                ),
                                              ),
                                            ),
                                          ],
                                          onSelected: (value) {
                                            if (value == 'delete') {
                                              showDeleteValidationAlert(context,
                                                  () {
                                                controller.deleteCategoryCard(
                                                    index, context);
                                              });
                                            } else if (value == 'edit') {
                                              showEditCategoryCard(
                                                  context, category, T, index);
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
