import 'package:censible_app/screens/AUTH/selectauth_screen.dart';
import 'package:censible_app/screens/AUTH/signin_screen.dart';
import 'package:censible_app/screens/AUTH/signup_screen.dart';
import 'package:censible_app/screens/CTRL/ctrl_screen.dart';
import 'package:censible_app/screens/CALCU/calculator_screen.dart';
import 'package:censible_app/screens/PAGE/account_screen.dart';
import 'package:censible_app/screens/PAGE/analysis_screen.dart';
import 'package:censible_app/screens/PAGE/category_screen.dart';
import 'package:censible_app/screens/PAGE/records_screen.dart';
import 'package:censible_app/screens/SPLASH/splash_screen.dart';
import 'package:censible_app/screens/START/setcurrency_screen.dart';
import 'package:censible_app/screens/START/started_screen.dart';
import 'package:censible_app/screens/START/walk_screen.dart';
import 'package:get/get.dart';

class ScreenRouter {
// # Route Name
  static const _splash = '/splash';
  static const _walkThru = '/walkThru';
  static const _started = '/started';
  static const _setcurrency = '/setcurrency';
  static const _authSelect = '/authSelect';
  static const _signin = '/signin';
  static const _signup = '/signup';

  // # Dashboard Route
  static const _ctrl = '/ctrl';
  static const _records = '/records';
  static const _analysis = '/analysis';
  static const _account = '/account';
  static const _category = '/category';

  // # Route Function
  static const _calculator = '/calculator';

// # Get Method
  static String get getSplashscreenRoute => _splash;
  static String get getWalkThruscreenRoute => _walkThru;
  static String get getStartedScreenRoute => _started;
  static String get getSetcurrencyScreenRoute => _setcurrency;
  static String get getSelectAuthScreenRoute => _authSelect;
  static String get getSigninScreenRoute => _signin;
  static String get getSignupScreenRoute => _signup;

  static String get getCtrlScreenRoute => _ctrl;
  static String get getRecordsScreenRoute => _records;
  static String get getAnalysisScreenRoute => _analysis;
  static String get getAccountScreenRoute => _account;
  static String get getCategoryScreenRoute => _category;

  static String get getCalculatorScreenRoute => _calculator;

// # List of Routes
  static List<GetPage> routes = [
    GetPage(
        name: _splash,
        page: () => SplashScreen(),
        preventDuplicates: true,
        transitionDuration: 500.milliseconds),
    GetPage(
        name: _walkThru,
        page: () => WalkThruScreen(),
        preventDuplicates: true,
        transitionDuration: 500.milliseconds),
    GetPage(
        name: _started,
        page: () => const StartedScreen(),
        preventDuplicates: true,
        transitionDuration: 500.milliseconds),
    GetPage(
        name: _setcurrency,
        page: () => const SetcurrencyScreen(),
        preventDuplicates: true,
        transitionDuration: 500.milliseconds),
    GetPage(
        name: _authSelect,
        page: () => const AuthSelectScreen(),
        preventDuplicates: true,
        transitionDuration: 500.milliseconds),
    GetPage(
        name: _signin,
        page: () => const SignInScreen(),
        preventDuplicates: true,
        transitionDuration: 500.milliseconds),
    GetPage(
        name: _signup,
        page: () => const SignUpScreen(),
        preventDuplicates: true,
        transitionDuration: 500.milliseconds),
    GetPage(
      name: _ctrl,
      page: () => const ControlScreen(),
      preventDuplicates: true,
      transitionDuration: 500.milliseconds,
    ),
    GetPage(
      name: _records,
      page: () => const RecordsScreen(),
      preventDuplicates: true,
      transitionDuration: 500.milliseconds,
    ),
    GetPage(
      name: _analysis,
      page: () => const AnalysisScreen(),
      preventDuplicates: true,
      transitionDuration: 500.milliseconds,
    ),
    GetPage(
      name: _account,
      page: () => const AccountScreen(),
      preventDuplicates: true,
      transitionDuration: 500.milliseconds,
    ),
    GetPage(
      name: _category,
      page: () => const CategoryScreen(),
      preventDuplicates: true,
      transitionDuration: 500.milliseconds,
    ),
    GetPage(
      name: _calculator,
      page: () => CalculatorScreen(),
      preventDuplicates: true,
      transitionDuration: 500.milliseconds,
    )
  ];
}
