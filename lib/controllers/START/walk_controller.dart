import 'package:censible_app/data/walkThru_data.dart';
import 'package:censible_app/routes/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalkThruController extends GetxController {
  final _pageControl = PageController();
  final _WalkThru_Info = WALKTHRU_INFO;
  var selectedPage = 0.obs;
  var isNextButtonActive = true.obs; // Track the state of the Next button
  var isPreviousButtonActive =
      false.obs; // Track the state of the Previous button

  get isMaxPage => selectedPage.value == walkThruCount - 1;
  get isFirstPage => selectedPage.value == 0;
  get walkThruInfo => _WalkThru_Info;
  get walkThruCount => _WalkThru_Info.length;
  PageController get pageController => _pageControl;

  void updateButtonStates() {
    isNextButtonActive.value = !isMaxPage;
    isPreviousButtonActive.value = !isFirstPage;
    update();
  }

  void nextPage() {
    if (isMaxPage) {
      Get.toNamed(ScreenRouter.getSelectAuthScreenRoute);
      return;
    }
    selectedPage++;
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.linear);
    updateButtonStates();
  }

  void previousPage() {
    if (isFirstPage) {
      Get.offAllNamed(ScreenRouter.getStartedScreenRoute);
      return;
    }
    selectedPage--;
    pageController.previousPage(
        duration: 300.milliseconds, curve: Curves.linear);
    updateButtonStates();
  }

  void skipPage() {
    if (isMaxPage) {
      Get.toNamed(ScreenRouter.getSelectAuthScreenRoute);
      return;
    }
    selectedPage.value = walkThruCount;
    pageController.animateToPage(
      walkThruCount,
      duration: 300.milliseconds,
      curve: Curves.linear,
    );
    updateButtonStates();
  }
}
