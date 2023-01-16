import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluuter_mt/helper/api_interceptor_service.dart';
import 'package:http/http.dart' as http;
import 'package:fluuter_mt/helper/base_view_model.dart';
import 'package:fluuter_mt/helper/network_error_handling.dart';
import 'package:fluuter_mt/service/sharedprefs_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_interceptor/extensions/extensions.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class AuthViewModel extends BaseViewModel {
  Ref ref;
  AuthViewModel(this.ref);

  String _userDetails = "";
  String get userDetails => _userDetails;

  http.Client client = InterceptedClient.build(interceptors: [
    ApiInterceptorService(),
  ])
    ..requestTimeout = const Duration(seconds: 40);

  Future<String> getLogin(
      String email, String password) async {
    try {
    var response=  await fetchApi(email, password);
    log(response.toString());
     log(response["status"].toString());
     _userDetails = response.toString();
        return response["status"].toString();
    } on Failure catch (e) {
      log(":::::: " + e.message.toString());
      return e.message.toString();
    }
  }

  Future<dynamic> fetchApi(String email, String password) async {
    Uri apiUrl = 'https://5mv.cyberfort.co.in/api/login'.toUri();
    try {
      http.Response response = await client.post(apiUrl,
          body: jsonEncode({"email": email, "password": password}));
      return validateResponse(response);
    } on SocketException {
      throw Failure("Server not responding");
    } catch (e) {
      if (e.toString().contains('SocketException')) {
        throw Failure("No Internet Connection");
      } else {
        if (e is Failure) {
          throw Failure(e.message,
              code: e.code, error: e.error, errorMessage: e.errorMessage);
        } else {
          throw Failure(e.toString());
        }
      }
    }
  }
}

final authViewModelProvider = StateProvider.autoDispose((ref) {
  return AuthViewModel(
    ref,
  );
});
