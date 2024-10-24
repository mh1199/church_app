// import 'dart:convert';
//
// import 'package:dio/io.dart';
// import 'package:dio_http2_adapter/dio_http2_adapter.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// import 'package:dio/dio.dart';
// import 'package:dio_smart_retry/dio_smart_retry.dart';
// import 'package:isolate_json/isolate_json.dart';
// import 'package:provider/provider.dart';
//
// import '../models/api_response.dart';
// import '/helpers/constants.dart';
// import '/helpers/enums.dart';
//
// import '/configs/flavor_management.dart';
// import '/configs/locator.dart';
//
// import '/services/preferences_service.dart';
//
// import '/stores/global_state.dart';
//
// import 'navigation_service.dart';
//
// abstract class NetworkService {
//
//   Future get(String url, Object auth, Function callBack, { required Object? params, required Function errorCallBack });
//   Future post(String url, Object auth, Function callBack, { required Object params, required Function errorCallBack });
//   Future put(String url, Object auth, Function callBack, { required Object params, required Function errorCallBack });
//
//   Future request(String url, Object auth, Function callBack, { required MethodEnum method, required Object params, required Function errorCallBack });
//
//   void onDioError(DioError error, VoidCallback reload, String url, String alert, String message, VoidCallback action);
//
// }
//
// class NetworkServiceImpl implements NetworkService {
//
//   final globalState = Provider.of<GlobalState>(locator<NavigationService>().context(), listen: false);
//
//   @override
//   Future get(String url, Object auth, Function callBack, { required Object? params, required Function errorCallBack }) async {
//     return request(url, auth, callBack, method: MethodEnum.GET, params: params, errorCallBack: errorCallBack);
//   }
//
//   @override
//   Future post(String url, Object auth, Function callBack, { required Object? params, required Function errorCallBack }) async {
//     return request(url, auth, callBack, method: MethodEnum.POST, params: params, errorCallBack: errorCallBack);
//   }
//
//   @override
//   Future delete(String url, Object auth, Function callBack, { required Object? params, required Function errorCallBack }) async {
//     return request(url, auth, callBack, method: MethodEnum.DELETE, params: params, errorCallBack: errorCallBack);
//   }
//
//   @override
//   Future put(String url, Object auth, Function callBack, { required Object params, required Function errorCallBack }) async {
//     return request(url, auth, callBack, method: MethodEnum.PUT, params: params, errorCallBack: errorCallBack);
//   }
//
//   @override
//   Future request(String url, Object auth, Function? callBack, { required MethodEnum method, required Object? params, required Function? errorCallBack }) async {
//
//     print('<net> url :: <' + method.toShortString() + '>' + url);
//     print('<net> params : $params');
//
//     var statusCode;
//
//     var errorMsg = '';
//     var resData = '';
//
//     var header = Constants.HEADER_AUTHORIZATION;
//
//     var authenticate = '';
//     var basicAuth = await locator<PreferencesServiceImpl>().getBasicAuth();
//
//      var token = await locator<PreferencesServiceImpl>().getToken();
//
//     if (auth is bool) {
//       if (auth) {
//
//         authenticate = Constants.BEARER + (token);
//
//       } else {
//         authenticate = Constants.BASIC + basicAuth;
//       }
//
//     } else if (auth is String) {
//       authenticate = auth;
//     }
//     print('authenticate :: $authenticate');
//
//
//     late Response response;
//     var headers = {
//       Constants.HEADER_CONTENT_TYPE: Constants.APPLICATION_JSON,
//       // Constants.APP: Constants.TRUE,
//       // Constants.ACCEPT : Constants.APPLICATION_JSON,
//
//     };
//
//     if (authenticate.isNotEmpty) headers.addAll({header: authenticate});
//
//
//     print('headers :: $headers');
//     print('baseUrl :: ${FlavorConfig.getServerURL()}');
//
//     try {
//       final Dio dio = Dio();
//       dio.options.baseUrl = FlavorConfig.getServerURL();
//       dio.options.connectTimeout = const Duration(minutes: 1);
//       dio.options.receiveTimeout = const Duration(minutes: 1);
//       dio.options.sendTimeout = const Duration(minutes: 1);
//       dio.options.responseType = ResponseType.plain;
//       dio.options.contentType= Headers.formUrlEncodedContentType;
//       dio.options.headers = headers;
//       // dio.httpClientAdapter = Http2Adapter(
//       //   ConnectionManager(
//       //     idleTimeout: const Duration(seconds: 10),
//       //     // Ignore bad certificate
//       //     onClientCreate: (_, config) => config.onBadCertificate = (_) => true,
//       //   ),
//       // );
//       (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
//         client.badCertificateCallback = (cert, host, port) {
//           return true;
//         };
//       };
//       dio.interceptors.add(
//         RetryInterceptor(
//           dio: dio,
//           logPrint: print,
//           retries: 3,
//           retryDelays: const [
//             Duration(seconds: 3),
//             Duration(seconds: 5),
//             Duration(seconds: 10),
//           ],
//         ),
//       );
//
//       // late Response response;
//       if (method == MethodEnum.GET) {
//         print("params");
//         print(params);
//         if (params != null && params is Map<String, Object>) {
//           StringBuffer sb = StringBuffer('?');
//           params.forEach((key, value) {
//             sb.write('$key' '=' '$value' '&');
//           });
//           String paramStr = sb.toString();
//           paramStr = paramStr.substring(0, paramStr.length - 1);
//           url += paramStr;
//
//         }
//
//           response = await dio.get(url, options: Options(headers: headers));
//
//
//       }
//       else if (method == MethodEnum.POST) {
//
//         if (params != null) {
//           print("====");
//           print('url $url');
//
//           response = await dio.post(url,data: params);
//         } else {
//           print("post");
//           response = await dio.post(url);
//         }
//       } else if (method == MethodEnum.PUT) {
//         if (params != null) {
//           response = await dio.put(url, data: params);
//         } else {
//           response = await dio.put(url);
//         }
//       }
//       else if (method == MethodEnum.DELETE) {
//
//         if (params != null) {
//           response = await dio.delete(url,data: params);
//         } else {
//           response = await dio.delete(url);
//         }
//       }
//
//       resData = response.data;
//       statusCode = response.statusCode ?? -1;
//       print("statusCode $statusCode");
//       // print(resData);
//       if (statusCode < 0) {
//         errorMsg = '<net> errorCode :: $statusCode';
//         if (errorCallBack != null) {
//           errorCallBack(errorMsg);
//         }
//         print('<net> errorMsg :: ' + errorMsg);
//         return null;
//       }
//
//       var data = await JsonIsolate().decodeJson(resData);
//       if (callBack != null) callBack(data);
//       print('<net> response data :: ' + resData);
//       return data;
//     } on DioError catch (e) {
//       print('<net> dio errorMsg :: $e');
//
//       print("=====");
//       print(errorCallBack != null);
//       if (errorCallBack != null) {
//         errorCallBack(e);
//       }
//     } catch (exception) {
//       print('<net> exception errorMsg :: ');
//       if (errorCallBack != null) {
//         errorCallBack(exception);
//       }
//     }
//     JsonIsolate().dispose();
//   }
//
//   @override
//   void onDioError(DioError error, VoidCallback reload, String url, String alert, String message, VoidCallback action) {
//     var errorText;
//     var statusCode;
//     if (error.response != null) {
//       statusCode = error.response?.statusCode;
//       print('dioError statusCode : $statusCode');
//     }
//     switch (error.type) {
//       case DioErrorType.cancel:
//         errorText = 'Connection lost, please check your internet connection and try again.';
//         print('dioError cancel : $errorText');
//         break;
//       case DioErrorType.connectionTimeout:
//         errorText = 'Connection Timeout. Check your Internet connection or contact Server administrator';
//         print('dioError connect timeout : $errorText');
//         globalState.showTimeout(url, reload);
//         break;
//       case DioErrorType.receiveTimeout:
//         errorText = 'Connection lost, please check your internet connection and try again.';
//         print('dioError receive timeout : $errorText');
//         globalState.showTimeout(url, reload);
//         break;
//       case DioErrorType.sendTimeout:
//         errorText = 'Connection lost, please check your internet connection and try again.';
//         print('dioError send timeout : $errorText');
//         globalState.showTimeout(url, reload);
//         break;
//       case DioErrorType.badResponse:
//         print('xx: response');
//         if (statusCode == 401 || statusCode == 404 || statusCode == 502) {
//           globalState.showMaintenance(url, reload);
//         } else {
//           if (error.response != null) {
//             try {
//               var json = jsonDecode(error.response!.data);
//               print('json: ' + json.toString());
//               GeneralResponse generalResponse = GeneralResponse.fromJson(json);
//               if (generalResponse.status == Constants.ERROR) {
//                 // var msg = message.isEmpty ? error.message : message;
//                 // alertDialog(alert, msg, '', action);
//               }
//             } catch (e) {
//               // var msg = message.isEmpty ? json.toString() : message;
//               // alertDialog(alert, msg, '', action);
//             }
//           }
//         }
//         print('error response: ${error.message}');
//         break;
//       case DioErrorType.connectionError:
//         errorText = 'Connection lost, please check your internet connection and try again.';
//         print('dioError other : $errorText');
//         if (statusCode == null) {
//           globalState.showMaintenance(url, reload);
//         }
//         break;
//     }
//   }
//
//   String errorBaseOnHttpStatusCode(DioError dioError) {
//     String errorText;
//     if (dioError.response != null) {
//       if (dioError.response?.statusCode == 401) {
//         errorText = 'Something went wrong, please close the app and login again.';
//       } else if (dioError.response?.statusCode == 404) {
//         errorText = 'Connection lost, please check your internet connection and try again.';
//       } else if (dioError.response?.statusCode == 500) {
//         errorText = 'We could not connect to the product server. Please contact Server administrator';
//       } else {
//         errorText = 'Something went wrong, please close the app and login again. If the issue persists contact Server administrator';
//       }
//     } else {
//       errorText = 'Something went wrong, please close the app and login again. If the issue persists contact Server administrator';
//     }
//     return errorText;
//   }
//
// }
