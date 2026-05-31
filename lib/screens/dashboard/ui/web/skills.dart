import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';

class Skills extends StatelessWidget {
  final bool isWeb;
  const Skills({Key? key, required this.isWeb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive values
    double horizontalPadding = screenWidth < 600 ? 20 : (screenWidth < 1000 ? 60 : 100);
    double itemWidth = screenWidth < 600 ? 100 : (screenWidth < 1000 ? 110 : 120);

    return Container(
      width: double.infinity,
      color: Colors.grey.shade50,
      padding: EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          // Title
          Text(
            'Skills & Technologies',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 60,
            height: 3,
            color: Colors.blue,
          ),
          const SizedBox(height: 50),
          // Skills Grid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: controller.usingNowSkillsName.map((skill) =>
                  SizedBox(
                    width: itemWidth,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSkillIcon(skill.name),
                          const SizedBox(height: 12),
                          Text(
                            skill.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillIcon(String skillName) {
    final String assetPath = _getIconAssetPath(skillName);

    if (assetPath.isNotEmpty) {
      return Image.asset(
        assetPath,
        height: 50,
        width: 50,
        errorBuilder: (_, __, ___) => _getFallbackIcon(skillName),
      );
    }

    return _getFallbackIcon(skillName);
  }

  String _getIconAssetPath(String skillName) {
    switch (skillName.toUpperCase()) {
      case 'DART':
        return 'assets/icons/dart.png';
      case 'FLUTTER':
        return 'assets/icons/flutter.png';
      case 'JAVA':
        return 'assets/icons/java.png';
      case 'FIREBASE':
        return 'assets/icons/firebase.png';
      case 'GRAPHQL':
        return 'assets/icons/graphql.png';
      case 'GIT':
        return 'assets/icons/git.png';
      case 'FIGMA':
        return 'assets/icons/figma.png';
      case 'SOCKET.IO':
        return 'assets/icons/socketio.png';
      case 'FASTAPI':
        return 'assets/icons/fastapi.png';
      case 'MONGODB':
        return 'assets/icons/mongo.png';
      default:
        return '';
    }
  }

  Widget _getFallbackIcon(String skillName) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        _getFallbackIconData(skillName),
        size: 30,
        color: Colors.blue.shade700,
      ),
    );
  }

  IconData _getFallbackIconData(String skillName) {
    switch (skillName.toUpperCase()) {
      case 'DART':
        return Icons.format_size;
      case 'FLUTTER':
        return Icons.mobile_friendly;
      case 'JAVA':
        return Icons.coffee;
      case 'FIREBASE':
        return Icons.storage;
      case 'GRAPHQL':
        return Icons.api;
      case 'GIT':
        return Icons.code;
      case 'FIGMA':
        return Icons.design_services;
      case 'SOCKET.IO':
        return Icons.chat;
      case 'FASTAPI':
        return Icons.speed;
      case 'MONGODB':
        return Icons.storage;
      default:
        return Icons.code;
    }
  }
}