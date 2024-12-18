import 'package:censible_app/components/element/cust_bottomnav.dart';
import 'package:censible_app/controllers/INFO/ctrl_controller.dart';
import 'package:censible_app/routes/screen_routes.dart';
import 'package:censible_app/screens/PAGE/account_screen.dart';
import 'package:censible_app/screens/PAGE/analysis_screen.dart';
import 'package:censible_app/screens/PAGE/category_screen.dart';
import 'package:censible_app/screens/PAGE/records_screen.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:censible_app/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen>
    with WidgetsBindingObserver, Application {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    final int? initialPage = Get.arguments as int?;
    if (initialPage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageController.jumpToPage(initialPage);
        Get.find<CtrlController>().updateIndex(initialPage);
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      int? index = Get.arguments as int?;
      if (index != null) {
        Get.find<CtrlController>().updateIndex(index);
        _pageController.jumpToPage(index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CtrlController>(
      init: Get.put(CtrlController(), permanent: false),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: color.peach,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          title: Text(
            "CENTSIBLE",
            style: CustomText(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 2,
              color: dark.lightCharcoal,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                if (controller.selectedIndex.value != index) {
                  controller.updateIndex(index);
                }
              },
              children: const [
                RecordsScreen(),
                AnalysisScreen(),
                AccountScreen(),
                CategoryScreen(),
              ],
            ),
            Positioned(
                bottom: 120,
                right: 15,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(color.primary),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        elevation: const WidgetStatePropertyAll(5),
                        padding: const WidgetStatePropertyAll(
                          EdgeInsets.all(18),
                        )),
                    onPressed: () =>
                        Get.toNamed(ScreenRouter.getCalculatorScreenRoute),
                    child: Icon(
                      Icons.add,
                      size: 25,
                      color: color.primaryDark,
                    ))),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Obx(
                () => CustBottomNav(
                  selectedIndex: controller.selectedIndex.value,
                  onTap: (index) {
                    if (_pageController.page != index.toDouble()) {
                      controller.updateIndex(index);
                      _pageController.jumpToPage(index);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
