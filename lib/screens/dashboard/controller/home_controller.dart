import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/common_controller.dart';
import '../../../models/skills_data.dart';

///My home Controller
class HomeController extends CommonController {

  // Skills data with proper images
  final RxList<SkillsData> usingNowSkillsName = <SkillsData>[
    SkillsData('DART', 'icons/dart.png'),
    SkillsData('FLUTTER', 'icons/flutter.png'),
    SkillsData('JAVA', 'icons/java.png'),
    SkillsData('FIREBASE', 'icons/firebase.png'),
    SkillsData('GRAPHQL', 'icons/graphql.png'),
    SkillsData('GIT', 'icons/git.png'),
    SkillsData('FIGMA', 'icons/figma.png'),
    SkillsData('SOCKET.IO', 'icons/socketio.png'),
    SkillsData('FASTAPI', 'icons/fastapi.png'),
    SkillsData('MONGODB', 'icons/mongodb.png'),
  ].obs;

  // Menu items for navigation
  final List<String> menuNames = ['About me', 'Skills', 'Portfolio', 'Contact Us'];

  // Scroll controller for the main list
  final ScrollController myListController = ScrollController();

  // Reactive variable for current section (for highlighting active menu)
  final RxInt currentSection = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Add scroll listener to update active section
    myListController.addListener(_onScroll);
  }

  void _onScroll() {
    // Logic to update current section based on scroll position
    // This will be implemented when we have section keys
  }

  // ✅ Add scroll function
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    myListController.dispose();
    super.onClose();
  }
}