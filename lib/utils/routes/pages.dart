// ignore_for_file: unused_import

import 'package:extranet_testapp/views/home_screen.dart';
import 'package:extranet_testapp/views/user_screen.dart';
import 'package:get/get.dart';
import 'routes.dart';

class Pages {
  static var list = [
    GetPage(
      name: Routes.userScreen,
      page: () => UserScreen(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      // binding: SplashBinding(),
    ),
    // GetPage(
    //   name: Routes.changepinScreen,
    //   page: () => ChangePinScreen(),
    //   // binding: SplashBinding(),
    // ),

  ];
}
