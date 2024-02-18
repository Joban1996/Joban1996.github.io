import 'dart:io';
import 'package:oktoast/oktoast.dart';
import '../components/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/buttons.dart';
import 'constants.dart';

class Util {
  static showStatus(
      {required BuildContext? context,
        required String message,
        required bool isSuccess}) {
    Get.snackbar(
        isSuccess == true
            ? 'Success'
            : 'Error',
        message,
        colorText: Theme.of(context!).colorScheme.onPrimary,
        //duration:  const Duration(milliseconds: 1500),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: isSuccess == true
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.error,
        icon: isSuccess == true
            ? const Icon(Icons.check_circle, color: Colors.white)
            : const Icon(Icons.error, color: Colors.white));
  }

  static showMessage({required String message, BuildContext? context}){
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        content: Text(message, style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary
        ),),
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        width: Get.width * 0.26, // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
    showToast(message, textStyle: TextStyle(
      fontSize: 12.0.px,
    ), position: ToastPosition.bottom,textPadding: const EdgeInsets.all(8));
}

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Widget addProgressIndicator(double? size) {
    return Center(
        child: SizedBox(
          width: size ?? 50,
          height: size ?? 50,
          child: CircularProgressIndicator(
              strokeWidth: 2.0,
              backgroundColor: Colors.black12,
              valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(Get.context!).colorScheme.primary)),
        ));
  }

  static Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static void showConfirmationAlert(
      {required String title,
        required String subTitle,
        required BuildContext cxt,
        required VoidCallback okHandler}) {
    showDialog(
      context: cxt,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 220,
            width: Get.width,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: BorderButtonType1(
                              text: 'Yes',
                              onPress: () {
                                Get.back(closeOverlays: true);
                                okHandler();
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: FilledButtonType1(
                              isEnabled: true,
                              text: 'No',
                              onPress: () {
                                Get.back(closeOverlays: true);
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ).round(20),
        );
      },
    );
  }

  static void showDemoAppConfirmationAlert(
      {required String title,
        required String subTitle,
        required BuildContext cxt,
        required VoidCallback okHandler}) {
    showDialog(
      context: cxt,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 200,
            width: Get.width,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: BorderButtonType1(
                              text:'Ok',
                              onPress: () {
                                Get.back(closeOverlays: true);
                                okHandler();
                              }),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ).round(20),
        );
      },
    );
  }

  /// scale size will generate the value of entered size according to current screen size
  /// @size will be in px
  static double scaleSize(double size) {
    double referenceWidth = referenceScreenWidth;
    double referenceHeight = referenceScreenHeight;

    double screenWidth = Get.size.width;
    double screenHeight = Get.size.height;

    double widthScaleFactor = screenWidth / referenceWidth;
    double heightScaleFactor = screenHeight / referenceHeight;

    double scaleFactor = (widthScaleFactor + heightScaleFactor) / 2;

    return size * scaleFactor;
  }
}
