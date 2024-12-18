import 'package:censible_app/components/function/cust_indicator.dart';
import 'package:censible_app/controllers/START/walk_controller.dart';
import 'package:censible_app/model/walkThru_model.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

class WalkThruScreen extends StatelessWidget with Application {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalkThruController>(
      init: WalkThruController(),
      builder: (walkControl) => Scaffold(
        backgroundColor: color.white,
        body: Stack(
          fit: StackFit.loose,
          alignment: Alignment.topCenter,
          children: [
            PageView.builder(
              controller: walkControl.pageController,
              onPageChanged: (value) {
                walkControl.selectedPage.value = value;
              },
              itemCount: walkControl.walkThruCount,
              itemBuilder: (context, index) {
                return FeatureDetail(
                  walkData: walkControl.walkThruInfo[index],
                  walkControl: walkControl,
                );
              },
            ),
            TopNavigation(walkControl: walkControl),
            BottomNavigation(walkControl: walkControl),
          ],
        ),
      ),
    );
  }
}

class FeatureDetail extends StatelessWidget with Application {
  FeatureDetail({super.key, required this.walkData, required this.walkControl});

  WalkthruDataModel walkData;
  WalkThruController walkControl;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 500.milliseconds,
      curve: Curves.linear,
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
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Material(
                elevation: 7,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Image.asset(
                    walkData.imageAsset,
                    fit: BoxFit.fill,
                    scale: 5,
                  ),
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                children:
                    walkData.title.split(' ').asMap().entries.map((entry) {
                  if (entry.key <= 1) {
                    return TextSpan(
                      text: '${entry.value} ',
                      style: style.displayMedium(context, color: color.primary),
                    );
                  } else {
                    return TextSpan(
                      text: '${entry.value} ',
                      style: style.displayMedium(context,
                          color: dark.lightCharcoal),
                    );
                  }
                }).toList(),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            Text(
              walkData.description,
              textAlign: TextAlign.center,
              style: style.titleMedium(context, color: dark.lightCharcoal),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}

class TopNavigation extends StatelessWidget with Application {
  TopNavigation({super.key, required this.walkControl});
  WalkThruController walkControl;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 36,
          horizontal: 18,
        ),
        child: Row(
          children: [
            Image.asset(
              icon.LOGO,
              scale: 8,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "CENT",
                    style: style.titleLarge(context, color: color.primary),
                  ),
                  TextSpan(
                    text: "SIBLE",
                    style: style.titleLarge(context, color: dark.lightCharcoal),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  walkControl.skipPage();
                },
                child: Text(
                  'SKIP',
                  style: style.titleLarge(context, color: dark.lightCharcoal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget with Application {
  BottomNavigation({super.key, required this.walkControl});
  WalkThruController walkControl;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => IconButton(
                style: style.button1(
                  size: const Size(50, 50),
                  backgroundColor: walkControl.selectedPage.value == 0 ||
                          walkControl.selectedPage.value == 1 ||
                          walkControl.selectedPage.value == 2
                      ? color.primary
                      : color.whiteOpacity50,
                  borderWidth: 1.5,
                  borderColor: walkControl.selectedPage.value == 0 ||
                          walkControl.selectedPage.value == 1 ||
                          walkControl.selectedPage.value == 2
                      ? color.primary
                      : color.primary,
                  radius: 10,
                ),
                onPressed: () {
                  walkControl.previousPage();
                },
                icon: const Icon(Icons.arrow_back_rounded),
                color: walkControl.selectedPage.value == 0 ||
                        walkControl.selectedPage.value == 1 ||
                        walkControl.selectedPage.value == 2
                    ? dark.lightCharcoal
                    : color.primary,
              ),
            ),
            Obx(
              () => CustomAnimatedIndicator(
                initial: walkControl.selectedPage.value,
                count: 4,
                curve: Curves.bounceInOut,
                duration: Durations.medium2,
                color: color.primary.withOpacity(0.5),
                activeColor: color.primary,
                size: const Size(11, 11),
                activeWidth: 3,
                gap: 5,
              ),
            ),
            Obx(
              () => IconButton(
                style: style.button1(
                  size: const Size(50, 50),
                  backgroundColor: walkControl.selectedPage.value == 3 ||
                          walkControl.selectedPage.value == 2 ||
                          walkControl.selectedPage.value == 1
                      ? color.primary
                      : color.whiteOpacity50,
                  borderWidth: 1.5,
                  borderColor: walkControl.selectedPage.value == 3 ||
                          walkControl.selectedPage.value == 2 ||
                          walkControl.selectedPage.value == 1
                      ? color.primary
                      : color.primary,
                  radius: 10,
                ),
                onPressed: () {
                  walkControl.nextPage();
                },
                icon: const Icon(Icons.arrow_forward_rounded),
                color: walkControl.selectedPage.value == 3 ||
                        walkControl.selectedPage.value == 2 ||
                        walkControl.selectedPage.value == 1
                    ? dark.lightCharcoal
                    : color.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
