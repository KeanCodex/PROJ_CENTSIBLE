import 'package:censible_app/routes/screen_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    showNextScreen();
  }

  Future showNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    await Get.toNamed(ScreenRouter.getStartedScreenRoute);
  }
}
