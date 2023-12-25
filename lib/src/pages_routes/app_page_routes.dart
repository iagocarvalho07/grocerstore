import 'package:get/get.dart';
import 'package:grocerstore/src/pages/authentication/sing_up_screen.dart';
import 'package:grocerstore/src/pages/base/base_screen.dart';
import 'package:grocerstore/src/pages/splash_page/splashe_page.dart';

import '../pages/authentication/sing_in.dart';

abstract class AppPageRoutes {
  static final page = <GetPage>[
    GetPage(name: PageRoutesName.SplashScreen, page: () => SplashScreen()),
    GetPage(name: PageRoutesName.SingInScreen, page: () => SingScreen()),
    GetPage(name: PageRoutesName.SingUpScreen, page: () => SingUpScreen()),
    GetPage(name: PageRoutesName.BaseScreen, page: ()=> BaseScreen())


  ];
}

abstract class PageRoutesName{
  static const String SplashScreen = "/splashepage";
  static const String SingInScreen = "/singin";
  static const String SingUpScreen = "/singUp";
  static const String BaseScreen = '/';

}