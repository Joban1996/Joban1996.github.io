import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../controller/portfolio_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(HomeController.new);
    Get.lazyPut(PortfolioController.new);
  }
}