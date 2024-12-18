import 'package:censible_app/controllers/AUTH/signin_controller.dart';
import 'package:censible_app/controllers/AUTH/signup_controller.dart';
import 'package:censible_app/controllers/CALCU/calculator_controller.dart';
import 'package:censible_app/controllers/INFO/ctrl_controller.dart';
import 'package:censible_app/controllers/PAGE/account_controller.dart';
import 'package:censible_app/controllers/PAGE/analysis_controller.dart';
import 'package:censible_app/controllers/PAGE/budget_controller.dart';
import 'package:censible_app/controllers/PAGE/category_controller.dart';
import 'package:censible_app/controllers/PAGE/records_controller.dart';
import 'package:censible_app/controllers/SPLASH/splash_controller.dart';
import 'package:censible_app/controllers/START/setcurrency_controller.dart';
import 'package:censible_app/controllers/START/walk_controller.dart';
import 'package:get/get.dart';

class InitDep implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies'
    Get.lazyPut(() => SplashController()); //splash
    Get.lazyPut(() => WalkThruController()); //walkthru
    Get.lazyPut(() => SetcurrencyController()); //setcurrency
    Get.lazyPut(() => SignupController()); //signup
    Get.lazyPut(() => SigninController()); //signin

    // Dashboard Controller
    Get.lazyPut(() => CtrlController()); //ctrl
    Get.lazyPut(() => RecordsController()); //records
    Get.lazyPut(() => AnalysisController()); //analysis
    Get.lazyPut(() => BudgetController()); //budget
    Get.lazyPut(() => AccountController()); //account
    Get.lazyPut(() => CategoryController()); //category

    // Calculator Controller
    Get.lazyPut(() => CalculatorController()); //calculator
  }
}
