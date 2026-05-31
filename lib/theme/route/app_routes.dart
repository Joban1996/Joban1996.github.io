


import 'package:get/get.dart';
import '../../screens/dashboard/binding/home_binding.dart';
import '../../screens/dashboard/ui/check_screen.dart';
import '../../screens/login/login_screen.dart';
import '../../screens/splash_screen.dart';
import 'route_names.dart';

///This class has all routes defined
class AppRoutes{

 ///static list for routes
 static allRoutes() => [
    GetPage(name: RouteNames.splashScreen, page: SplashScreen.new),
    GetPage(name: RouteNames.loginScreen, page: LoginScreen.new),
    GetPage(name: RouteNames.homeScreen, page: CheckScreen.new,binding: HomeBinding())
  ];

}