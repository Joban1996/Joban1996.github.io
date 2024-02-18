import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../apis/constants.dart';
import '../apis/secure_storage_utils.dart';
import '../theme/route/route_names.dart';

///This is a first screen that will appears for 3 to 4 seconds
class SplashScreen extends StatefulWidget {
  ///Splash constructor
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  var selected = false.obs;
  var authToken;

  doAnimationLogo() {
    selected.value = true;
  }


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), doAnimationLogo);
    Timer(const Duration(seconds: 4), () async {
      authToken = await SecureStorageUtils().readSecureData(PREF_TOKEN);
      if (authToken != null) {
      Get.offNamed(RouteNames.homeScreen);
       } else {
        Get.offNamed(RouteNames.homeScreen);
      }
    });
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.easeInOutBack,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);
    Future.delayed(
      const Duration(seconds: 1),
          () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Theme.of(context).colorScheme.primary,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 700,
                      child: Stack(
                        children: [
                          Center(child: Text('Get started'.tr))
                        ],
                      ),
                    ),

                  ]),
            )));
  }
}