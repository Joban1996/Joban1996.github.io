import '../screens/login/login_screen.dart';
import 'package:compress_images_flutter/compress_images_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../apis/constants.dart';
import '../apis/utils.dart';

class CommonController extends GetxController {
  var screenWidth = Get.width;
  var screenHeight = Get.height;
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  RxBool tokenHasExpired = false.obs;
  late final CompressImagesFlutter compressImagesFlutter;


  @override
  void onInit() {
    compressImagesFlutter = CompressImagesFlutter();
    super.onInit();
  }

  void showNetworkError() {
    Util.showStatus(
        context: Get.context!,
        message: 'No internet available',
        isSuccess: false);
  }

  void showSuccessMessage({String? message}) {
    Util.showStatus(
        context: Get.context!, message: message ?? 'Success', isSuccess: true);
  }

  void showError(String message) {
    Util.showStatus(context: Get.context!, message: message, isSuccess: false);
  }

  void showServerError({String? message}) {
    Util.showStatus(
        context: Get.context!,
        message: message ?? 'Something went wrong. Please try again later.',
        isSuccess: false);
  }

  void unAuthorizeAndLogout() {
    Util.showStatus(
        context: Get.context!,
        message: 'Your session has been expired. Please login again',
        isSuccess: false);
  }

  void showLoader() {
    EasyLoading.show(status: 'Loading', maskType: EasyLoadingMaskType.black);
  }

  void hideLoader() {
    EasyLoading.dismiss();
  }

  Future<void> checkToken() async {
    var secureStorage = const FlutterSecureStorage();
    var authToken = await secureStorage.read(key: PREF_TOKEN);
    tokenHasExpired.value = JwtDecoder.isExpired(authToken??'');
    if (tokenHasExpired.value) {
      const FlutterSecureStorage().deleteAll();
      Get.offAll(()=>const LoginScreen());
    }
  }

}
