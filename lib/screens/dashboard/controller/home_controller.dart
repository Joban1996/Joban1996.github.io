import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../controller/common_controller.dart';
import '../../../models/skills_data.dart';

///My home Controller
class HomeController extends CommonController{



  RxList<SkillsData> usingNowSkillsName = [SkillsData('DART','assets/icons/Dart_Icon.webp'),SkillsData('JAVA','assets/icons/Dart_Icon.webp'),SkillsData('FIREBASE','assets/icons/Dart_Icon.webp'),SkillsData('GRAPHQL', 'assets/icons/Dart_Icon.webp'),SkillsData('GIT', 'assets/icons/Dart_Icon.webp'),SkillsData('FIGMA','assets/icons/Dart_Icon.webp'),SkillsData('SOCKET.IO','assets/icons/Dart_Icon.webp')].obs;
  RxList<String> usingNowSkillsImg = ['assets/icons/Dart_Icon.webp','assets/icons/Dart_Icon.webp','assets/icons/Dart_Icon.webp',
    'assets/icons/Dart_Icon.webp','assets/icons/Dart_Icon.webp','assets/icons/Dart_Icon.webp','assets/icons/Dart_Icon.webp'].obs;
  List<String> menuNames = ['About me','Skills','Portfolio','CONTACT US'];

  ScrollController myListController  = ScrollController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}