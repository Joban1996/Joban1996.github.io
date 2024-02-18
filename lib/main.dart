import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'theme/getx_localization/languages.dart';
import 'theme/route/app_routes.dart';
import 'theme/route/route_names.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

///My app class
class MyApp extends StatelessWidget {
  ///my app constructor
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.config(
      enableLog: true,
    );

    return OKToast(
      child: GetMaterialApp(
          title: 'Project',
          debugShowCheckedModeBanner: false,
          enableLog: true,
          smartManagement: SmartManagement.full,
          translations: Languages(),
          locale: Locale('en','US'),
          //locale: Locale('pa','IN'),
          fallbackLocale: Locale('en','US'),
          theme: AppTheme.lightTheme,
          initialRoute: RouteNames.splashScreen,
          getPages: AppRoutes.allRoutes(),
          builder: EasyLoading.init()),
    );
  }
}
