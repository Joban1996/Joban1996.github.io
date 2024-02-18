import 'dart:async';
import 'dart:collection';
import '../../apis/utils.dart';
import '../../theme/route/route_names.dart';
import 'package:get/get.dart';
import '../../../apis/api_clients.dart';
import '../../controller/common_controller.dart';

enum LoginStatus {
  loggedIn,
  invalidCredentials,
  invalidPassword,
  invalidEmail,
  noInternet,
  otherError,
  signup
}

RxList loginResponse = [].obs;

class LoginController extends CommonController {

  var isNameEmpty = true.obs;
  var isFirstTime = true.obs;
  RxBool loading = false.obs;
  RxBool emailEmptyError = false.obs;
  RxBool emailValidError = false.obs;
  RxBool passwordEmptyError = false.obs;
  RxBool passwordValidError = false.obs;
  RxBool passwordVisible = false.obs;
  RxBool iconVisible = false.obs;
  RxBool emailErrorForgot = false.obs;
  RxBool emailValidErrorForgot = false.obs;

  emailOnChanged() {
    emailEmptyError.value = false;
    emailValidError.value = false;
    update();
  }

  passwordOnChanged() {
    passwordEmptyError.value = false;
    passwordValidError.value = false;
    update();
  }

  emailOnChangedForgot() {
    emailErrorForgot.value = false;
    update();
  }

  iconHide() {
    iconVisible.value = false;
    update();
  }

  iconShow() {
    iconVisible.value = true;
    update();
  }

  Future<void> validateAndLogin(String email, String password) async {
    isFirstTime.value = false;
    showLoader();
    bool emailValid = RegExp(
            r'^[a-zA-Z0-9.\-_]+@[a-zA-Z0-9]+\.([a-zA-Z]{2,5})+(\.[a-zA-Z]{2,5})?')
        .hasMatch(email);
    bool passValid = RegExp(r'^(?=.*[a-zA-Z\d].*)[a-zA-Z\d!@.#$%&*]{3,}$')
        .hasMatch(password);
    if (email.isEmpty || !emailValid || password.isEmpty || !passValid) {
      if (email.isEmpty) {
        emailEmptyError.value = true;
      }
      if (!emailValid) {
        emailValidError.value = true;
      }
      if (password.isEmpty) {
        passwordEmptyError.value = true;
      }
      if (!passValid) {
        passwordValidError.value = true;
      }
      if (!emailValid && email.isNotEmpty ||
          !passValid && password.isNotEmpty) {
        Util.showStatus(
            context: Get.context,
            message: 'Invalid Email or Password',
            isSuccess: false);
      }
      update();
      hideLoader();
    } else {
      var params = HashMap<String, dynamic>();
      params['email'] = email;
      params['password'] = password;
      var response = await APIClient.loginUser(params);
      hideLoader();
      if (response == LoginStatus.loggedIn) {
        Util.showStatus(
            context: Get.context,
            message: 'Logged in successfully',
            isSuccess: true);

        // Future.delayed(Duration.zero, () {
        //   Get.offUntil(MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
        // });
      } else if (response == LoginStatus.invalidPassword) {
        loading.value = false;
        Util.showStatus(
            context: Get.context,
            message: 'Incorrect login details',
            isSuccess: false);
      } else if (response == LoginStatus.invalidEmail) {
        loading.value = false;
        Util.showStatus(
            context: Get.context,
            message: 'User does not exist',
            isSuccess: false);
      } else if (response == LoginStatus.noInternet) {
        showNetworkError();
      } else {
        showServerError();
      }
    }
  }

  Future<void> forgotPass(String email) async {
    bool emailValid = RegExp(
            r'^[a-zA-Z0-9.\-_]+@[a-zA-Z0-9]+\.([a-zA-Z]{2,5})+(\.[a-zA-Z]{2,5})?')
        .hasMatch(email);
    if (email.isEmpty || !emailValid) {
      if (email.isEmpty) {
        emailErrorForgot.value = true;
      }
      if (!emailValid && email.isNotEmpty) {
        emailValidErrorForgot.value = true;
        Util.showStatus(
            context: Get.context,
            message: 'Invalid Email Address',
            isSuccess: false);
      }
      update();
    } else {
      var params = HashMap<String, String>();
      params['email'] = email;
      var response = await APIClient.forgotPassword(params);

      if (response == LoginStatus.noInternet) {
        showNetworkError();
      } else if (response == LoginStatus.invalidEmail) {
        Util.showStatus(
            context: Get.context,
            message: 'User with this email doesn\'t exist',
            isSuccess: false);
      } else {
        Get.toNamed(RouteNames.loginScreen);
        Util.showStatus(
            context: Get.context,
            message: 'Reset password link has been sent to your email',
            isSuccess: true);
      }
    }
  }
}
