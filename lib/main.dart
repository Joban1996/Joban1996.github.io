import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'theme/getx_localization/languages.dart';
import 'theme/route/app_routes.dart';
import 'theme/route/route_names.dart';
import 'theme/theme.dart';

///key for first widget
var aboutSectionKey = GlobalKey();
///key for second widget
var skillSectionKey = GlobalKey();
///key for third widget
var portfolioSectionKey = GlobalKey();
///key for fourth widget
var contactSectionKey = GlobalKey();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
   await Firebase.initializeApp(
     options: FirebaseOptions(apiKey: 'AIzaSyDuZtCFJMMTo5atnNGI28Eh3wlBbg4dht8',
         appId: '1:328333044463:web:5cb400c9e278d440bf491a',
         messagingSenderId: '328333044463',
         projectId: 'portfolioweb-3a95a',
         storageBucket: 'portfolioweb-3a95a.appspot.com'),
   );
  }else{
      Firebase.initializeApp();
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Future.delayed(Duration.zero);
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
