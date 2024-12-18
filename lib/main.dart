import 'package:censible_app/firebase_options.dart';
import 'package:censible_app/helper/_init_dependencies.dart';
import 'package:censible_app/routes/screen_routes.dart';
import 'package:censible_app/screens/AUTH/signin_screen.dart';
import 'package:censible_app/screens/SPLASH/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeTimeZones();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await DBHelper.init();
  runApp(CensibleApp());
}

class CensibleApp extends StatelessWidget {
  CensibleApp({super.key}) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDep(),
      initialRoute: ScreenRouter.getSplashscreenRoute,
      getPages: ScreenRouter.routes,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
