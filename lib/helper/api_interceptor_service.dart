
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';
class ApiInterceptorService implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData? data}) async {
    data?.toHttpRequest().persistentConnection = false;
    data?.headers["Content-Type"] = "application/json";
    // if (AppConstants.AUTH_TOKEN != null) {
    //   data?.headers['Authorization'] = "Bearer ${AppConstants.AUTH_TOKEN}";
    // }
    // if (!kReleaseMode) {
    debugPrint("====HEADERS====\n${data?.headers.toString()}");
    debugPrint("====URL====\n${data?.url}");
    debugPrint("====METHOD====\n${data?.method.toString()}");
    debugPrint("====PARAMS====\n${data?.params.toString()}");
    debugPrint("====REQUEST====\n${data?.body.toString()}");
    // }
    return data!;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData? data}) async {


    // if (!kReleaseMode) {
    debugPrint("====RESPONSE====\n${data?.body.toString()}");
    debugPrint("====STATUS CODE====\n${data?.statusCode.toString()}");
    // }
    if (data?.statusCode == 401) {
      
    }
    return data!;
  }
}


