import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as Http;
import 'package:http_parser/http_parser.dart';
import '../../models/multipart_file_model.dart';
import '../constants.dart';
import '../utils.dart';
import 'enums.dart';
///Hit api service method for all apis
class HitApiService{

  ///This method will actually hit the service based on method(GET,PUT,POST
  static Future<dynamic>  hitService(
      String url,
      HttpMethod method,
      RequestBodyType type,
      HeaderType headerType,
      Map<String, dynamic>? fieldMap,
      {List<MultipartFileModel>? files}) async {
    if (await Util.checkInternet()) {
      var response;
      var headerMap = <String, String>{};

      headerMap['Accept'] = 'application/json';
      if (headerType == HeaderType.TYPE_LOGGED_IN) {
        var secureStorage = const FlutterSecureStorage();
        var authToken = await secureStorage.read(key: PREF_TOKEN);
        headerMap['Authorization'] = 'Bearer ${authToken ?? ''}';
      }

      switch (method) {
        case HttpMethod.HTTP_GET:
          {
            if (type == RequestBodyType.TYPE_MULTIPART) {
              headerMap['Content-Type'] = 'multipart/form-data';
              var request = Http.MultipartRequest('GET', Uri.parse(url));
              var map = fieldMap!.cast<String, String>();
              request.fields.addAll(map);
              request.headers.addAll(headerMap);
              debugPrint('Sending Request:: GET $url');
              try {
                response = await request.send();
              } on TimeoutException catch (_) {
                return WebError.INTERNAL_SERVER_ERROR;
              } on SocketException catch (_) {
                return WebError.INTERNAL_SERVER_ERROR;
              }
            } else {
              debugPrint('Sending Request:: GET $url');
              try {
                response = await Http.get(Uri.parse(url), headers: headerMap);
              } on TimeoutException catch (_) {
                return WebError.INTERNAL_SERVER_ERROR;
              } on SocketException catch (_) {
                return WebError.INTERNAL_SERVER_ERROR;
              }
            }
          }
          break;
        case HttpMethod.HTTP_POST:
          {
            if (type == RequestBodyType.TYPE_XX_URLENCODED_FORMDATA) {
              headerMap['Content-Type'] = 'application/x-www-form-urlencoded';
              debugPrint('Sending Request:: POST $url body $fieldMap');
              try {
                response = await Http.post(Uri.parse(url),
                    headers: headerMap,
                    body: fieldMap,
                    encoding: const convert.Utf8Codec());
              } on TimeoutException catch (_) {
                return WebError.INTERNAL_SERVER_ERROR;
              } on SocketException catch (_) {
                return WebError.INTERNAL_SERVER_ERROR;
              }
            } else if (type == RequestBodyType.TYPE_MULTIPART) {
              headerMap['Content-Type'] = 'multipart/form-data';
              var request = Http.MultipartRequest('POST', Uri.parse(url));
              var map = fieldMap?.cast<String, String>();
              if (map != null) {
                request.fields.addAll(map);
              }
              if (files != null && files.isNotEmpty) {
                for (var file in files) {
                  Http.MultipartFile multipartFile;
                  if (file.key.contains('video')) {
                    multipartFile = await Http.MultipartFile.fromPath(
                        file.key, file.file.path,
                        contentType: MediaType('video', 'mp4'));
                  } else if (file.key.contains('image')) {
                    multipartFile = await Http.MultipartFile.fromPath(
                        file.key, file.file.path,
                        contentType: MediaType('image', 'jpg'));
                  } else {
                    multipartFile = await Http.MultipartFile.fromPath(
                      file.key,
                      file.file.path,
                    );
                  }
                  request.files.add(multipartFile);
                }
                request.headers.addAll(headerMap);
                try {
                  response =
                  await request.send().timeout(const Duration(minutes: 2));
                } on TimeoutException catch (_) {
                  return WebError.INTERNAL_SERVER_ERROR;
                } on SocketException catch (_) {
                  return WebError.INTERNAL_SERVER_ERROR;
                }
              } else {
                request.headers.addAll(headerMap);
                try {
                  response = await request.send();
                } on TimeoutException catch (_) {
                  return WebError.INTERNAL_SERVER_ERROR;
                } on SocketException catch (_) {
                  return WebError.INTERNAL_SERVER_ERROR;
                }
              }
            } else {
              headerMap['Content-Type'] = 'application/json';
              headerMap['Accept'] = 'application/json';
              var json = convert.jsonEncode(fieldMap);
              debugPrint('Sending Request:: POST $url body $json');
              if (fieldMap == null) {
                try {
                  response = await Http.post(Uri.parse(url), headers: headerMap)
                      .timeout(const Duration(minutes: 1));
                } on TimeoutException catch (_) {
                  return WebError.INTERNAL_SERVER_ERROR;
                } on SocketException catch (_) {
                  return WebError.INTERNAL_SERVER_ERROR;
                }
              } else {
                try {
                  response = await Http.post(Uri.parse(url),
                      headers: headerMap, body: json)
                      .timeout(const Duration(minutes: 2));
                } on TimeoutException catch (_) {
                  return WebError.INTERNAL_SERVER_ERROR;
                } on SocketException catch (_) {
                  return WebError.INTERNAL_SERVER_ERROR;
                }
              }
            }
          }
          break;
        case HttpMethod.HTTP_PUT:
          if (type == RequestBodyType.TYPE_XX_URLENCODED_FORMDATA) {
            headerMap['Content-Type'] = 'application/x-www-form-urlencoded';
            debugPrint('Sending Request:: PUT $url body $fieldMap');
            response = await Http.put(Uri.parse(url),
                headers: headerMap,
                body: fieldMap,
                encoding: const convert.Utf8Codec());
          } else if (type == RequestBodyType.TYPE_MULTIPART) {
            headerMap['Content-Type'] = 'multipart/form-data';
            var request = Http.MultipartRequest('PUT', Uri.parse(url));
            var map = fieldMap?.cast<String, String>() ?? <String, String>{};
            request.fields.addAll(map);
            if (files != null && files.isNotEmpty) {
              for (var file in files) {
                var multipartFile = await Http.MultipartFile.fromPath(
                  file.key,
                  file.file.path,
                );
                request.files.add(multipartFile);
              }
            }
            request.headers.addAll(headerMap);
            try {
              response = await request.send();
            } on TimeoutException catch (_) {
              return WebError.INTERNAL_SERVER_ERROR;
            } on SocketException catch (_) {
              return WebError.INTERNAL_SERVER_ERROR;
            }
          } else {
            headerMap['Content-Type'] = 'application/json';
            var json = convert.jsonEncode(fieldMap);
            debugPrint('Sending Request:: PUT $url body $json');
            response =
            await Http.put(Uri.parse(url), headers: headerMap, body: json);
          }

          break;
        case HttpMethod.HTTP_PATCH:
          if (type == RequestBodyType.TYPE_XX_URLENCODED_FORMDATA) {
            headerMap['Content-Type'] = 'application/x-www-form-urlencoded';
            debugPrint('Sending Request:: PATCH $url body $fieldMap');
            response = await Http.patch(Uri.parse(url),
                headers: headerMap,
                body: fieldMap,
                encoding: const convert.Utf8Codec());
          } else if (type == RequestBodyType.TYPE_MULTIPART) {
            headerMap['Content-Type'] = 'multipart/form-data';
            var request = Http.MultipartRequest('PATCH', Uri.parse(url));
            var map = fieldMap?.cast<String, String>() ?? <String, String>{};
            request.fields.addAll(map);
            if (files != null && files.isNotEmpty) {
              for (var file in files) {
                var multipartFile = await Http.MultipartFile.fromPath(
                  file.key,
                  file.file.path,
                );
                request.files.add(multipartFile);
              }
            }
            request.headers.addAll(headerMap);
            try {
              response = await request.send();
            } on TimeoutException catch (_) {
              return WebError.INTERNAL_SERVER_ERROR;
            } on SocketException catch (_) {
              return WebError.INTERNAL_SERVER_ERROR;
            }
          } else {
            headerMap['Content-Type'] = 'application/json';
            var json = convert.jsonEncode(fieldMap);
            debugPrint('Sending Request:: PATCH $url body $json');
            response = await Http.patch(Uri.parse(url),
                headers: headerMap, body: json);
          }

          break;
      }
      var statusCode = response.statusCode;

      debugPrint('Response Code  :: $statusCode');
      if (response.statusCode == 200) {
        if (type == RequestBodyType.TYPE_MULTIPART) {
          var res = await Http.Response.fromStream(response);
          debugPrint('Response is :: ${res.body}');
          return res.body;
        } else {
          debugPrint('Response is :: ${response.body}');
        }
        return response.body;
      } else {
        switch (response.statusCode) {
          case 400:
            return WebError.BAD_REQUEST;
          case 500:
            return WebError.INTERNAL_SERVER_ERROR;
          case 404:
            return WebError.NOT_FOUND;
          case 409:
            return WebError.UNAUTHORIZED;
          default:
            return WebError.UNKNOWN;
        }
      }
    } else {
      return WebError.INTERNAL_SERVER_ERROR;
    }
  }

}