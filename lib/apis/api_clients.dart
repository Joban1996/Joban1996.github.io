import 'dart:async';
import 'dart:convert' as convert;
import 'api_helper/enums.dart';
import 'api_helper/hit_api_service.dart';
import 'secure_storage_utils.dart';
import '../models/forgot_password_model.dart';
import '../models/login_model.dart';
import '../screens/login/login_controller.dart';
import 'constants.dart';

/// This class will handle the API calls for the project
class APIClient {
  static const _BASE_URL = 'https://staging.carediary.com.au/api/';

  ///Login method
  static Future<dynamic> loginUser(Map<String, dynamic> params) async {
    var url = '${_BASE_URL}user/login';
    var actualResponse = await HitApiService.hitService(url, HttpMethod.HTTP_POST,
        RequestBodyType.TYPE_JSON, HeaderType.TYPE_PUBLIC_JSON, params);
    if (actualResponse is WebError) {
      if (actualResponse == WebError.INTERNAL_SERVER_ERROR) {
        return LoginStatus.noInternet;
      }
      if (actualResponse == WebError.UNAUTHORIZED ||
          actualResponse == WebError.BAD_REQUEST) {
        return LoginStatus.invalidPassword;
      }
      if (actualResponse == WebError.NOT_FOUND) {
        return LoginStatus.invalidEmail;
      } else {
        return LoginStatus.otherError;
      }
    }
    var jsonObject = convert.jsonDecode(actualResponse);
    var loginModel = LoginModel.fromJson(jsonObject);
    SecureStorageUtils()
        .writeSecureData(PREF_TOKEN,loginModel.jwt.toString());
    SecureStorageUtils()
        .writeSecureData(USERID,loginModel.user?.id.toString() ?? '');
    SecureStorageUtils().writeSecureData(
         USER_NAME,
        '${loginModel.user!.firstName} ${loginModel.user!.lastName}');
    return LoginStatus.loggedIn;
  }

  ///Forgot pass method
  static Future<dynamic> forgotPassword(Map<String, String> params) async {
    var url = '${_BASE_URL}user/forgot-password';
    var actualResponse = await HitApiService.hitService(url, HttpMethod.HTTP_POST,
        RequestBodyType.TYPE_JSON, HeaderType.TYPE_PUBLIC_JSON, params);
    if (actualResponse is WebError) {
      if (actualResponse == WebError.NOT_FOUND) {
        return LoginStatus.invalidEmail;
      }
    } else {
      var jsonObject = convert.jsonDecode(actualResponse);
      return ForgotPasswordModel.fromJson(jsonObject);
    }
  }
}
