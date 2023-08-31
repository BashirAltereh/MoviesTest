import 'dart:developer';

import 'package:dio/dio.dart';
import '../utils/constants.dart';

class AppInterceptor extends QueuedInterceptor {
  final Dio dio;

  AppInterceptor(this.dio);

  late Map<String, String> headers;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    headers = {
      'Authorization': 'Bearer ${Constants.apiKey}',
      'accept': 'application/json'
    };

    options.headers.addAll(headers);

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('onError: $err');
  }




  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('onResponse: ${response.data}');

    handler.next(response);
  }
}
