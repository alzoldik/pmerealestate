import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import 'appLocalization.dart';

class NetworkUtil with ChangeNotifier {
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  CancelToken cancelToken = CancelToken();
  factory NetworkUtil() => _instance;
  var  userModle;
  Dio dio = Dio();
  Future<Response> get(String url, {Map headers}) async {
    Map<String, String> headerss = headers != null
        ? headers
        : {
            "Authorization":
                "Bearer ${userModle == null ? null : userModle.data.apiToken}",
            "Content-Language": localization.currentLanguage.toString()
          };
    var response;
    try {
      dio.options.baseUrl = "https://foodbankapp.tqnee.com/api/v1/";
      response = await dio.get(url, options: Options(headers: headerss));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
        print("response: " + e.response.toString());
      } else {}
    }
    return handleResponse(response, navigator.currentContext);
  }

  Future<Response> post(String url,
      {Map headers, FormData body, encoding}) async {
    Map<String, String> headerss = headers != null
        ? headers
        : {
            "Authorization":
                "Bearer ${userModle == null ? null : userModle.data.apiToken}",
            "Content-Language": localization.currentLanguage.toString()
          };
    var response;
    dio.options.baseUrl = "https://foodbankapp.tqnee.com/api/v1/";
    try {
      response = await dio.post(
        url,
        data: body,
        // cancelToken: cancelToken,
        options: Options(headers: headerss, requestEncoder: encoding),
        onSendProgress: (int sent, int total) {
          final progress = sent / total;
          print('progress: $progress ($sent/$total)');
        },
      );
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
        print("response: " + e.response.toString());
      } else {}
    }
    return handleResponse(response, navigator.currentContext);
  }

  Future<Response> handleResponse(
      Response response, BuildContext context) async {
    if (response == null || response.data.runtimeType == String) {
      return Response(
          statusCode: 102,
          data: {
            "mainCode": 0,
            "code": 102,
            "data": null,
            "error": [
              {"key": "internet", "value": "هناك خطا يرجي اعادة المحاولة"}
            ]
          },
          requestOptions: null);
    } else {
      final int statusCode = response.statusCode;
      print("response: " + response.toString());
      print("statusCode: " + statusCode.toString());
      if (statusCode >= 200 && statusCode < 300) {
        return response;
      } else if (statusCode == 401) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        userModle = null;
        // pushAndRemoveUntil(Splash());
        return Response(
            statusCode: 401,
            data: {
              "mainCode": 0,
              "code": 401,
              "data": null,
              "error": [
                {"key": "internet", "value": "انتهت مده التسجيل"}
              ]
            },
            requestOptions: null);
      } else {
        return response;
      }
    }
  }
}
