import 'package:get/get.dart';
import '../../../apis/api_helper/portfolio_data.dart';

class PortfolioController extends GetxController {
  var selectedFilter = 'All'.obs;

  String get name => PortfolioData.name;
  String get title => PortfolioData.title;
  String get bio => PortfolioData.bio;
  List<String> get skills => PortfolioData.skills;
  List<Map<String, dynamic>> get projects => PortfolioData.projects;
  List<Map<String, String>> get socialLinks => PortfolioData.socialLinks;

  List<Map<String, dynamic>> get filteredProjects {
    if (selectedFilter.value == 'All') {
      return projects;
    }
    return projects.where((p) =>
        (p['tech'] as List).contains(selectedFilter.value)
    ).toList();
  }

  void filterProjects(String filter) {
    selectedFilter.value = filter;
  }
}