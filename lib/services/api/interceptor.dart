import 'dart:convert';

import 'package:applanguefront/services/storage/storage_service.dart';
import 'package:applanguefront/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as get_x;


class DioInterceptor extends Interceptor {
  final storageService = get_x.Get.find<StorageService>();
  String? token;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String headerMessage = "";
    try {
      token = storageService.apiToken;
    } catch(e) {
      log.e(e);
    }
    if(token !=null && storageService.isLoggedIn!) {
      options.headers['Authorization'] = 'token $token';
    }
    options.headers.forEach((k, v) => headerMessage += '► $k: $v\n');

    try {
      options.queryParameters.forEach(
            (k, v) => debugPrint(
          '► $k: $v',
        ),
      );
    } catch (_) {}
    try {
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final String prettyJson = encoder.convert(options.data);
      log.d(
        // ignore: unnecessary_null_comparison
        "REQUEST ► ︎ ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"${options.baseUrl}${options.path}"}\n\n"
            "Headers:\n"
            "$headerMessage\n"+
            "❖ QueryParameters : \n"
            "Body: $prettyJson",
      );
    } catch (e) {
      log.e("Failed to extract json request $e");
      // Crashlytics.nonFatalError(
      //   error: e,
      //   reason: "Failed to extract json request",
      // );
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{

    if (err.response?.statusCode == 403 ||
        err.response?.statusCode == 401) {
    }
    log.e(
      "<-- ${err.toString()} ${err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL'}\n\n"
          "${err.response != null ? err.response!.data : 'Unknown Error'}",
    );

    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String headerMessage = "";
    response.headers.forEach((k, v) => headerMessage += '► $k: $v\n');

    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String prettyJson = encoder.convert(response.data);
    log.d(
      // ignore: unnecessary_null_comparison
      "◀ ︎RESPONSE ${response.statusCode} ${response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL'}\n\n"
          "Headers:\n"
          "$headerMessage\n"
          "❖ Results : \n"
          "Response: $prettyJson",
    );
    super.onResponse(response, handler);
  }
}