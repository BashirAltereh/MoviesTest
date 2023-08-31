
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../utils/constants.dart';

class AppInterceptor extends QueuedInterceptor {
  final Dio dio;

  AppInterceptor(this.dio);

  late Map<String, String> headers;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    headers = {};
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final RequestOptions options = err.response!.requestOptions;
      final dioRequestOptions = Options(
          receiveDataWhenStatusError: options.receiveDataWhenStatusError,
          followRedirects: options.followRedirects,
          maxRedirects: options.maxRedirects,
          requestEncoder: options.requestEncoder,
          listFormat: options.listFormat,
          validateStatus: options.validateStatus,
          responseDecoder: options.responseDecoder,
          method: options.method,
          sendTimeout: options.sendTimeout,
          receiveTimeout: options.receiveTimeout,
          extra: options.extra,
          headers: options.headers,
          contentType: options.contentType);
      final tokenDio = Dio(
        BaseOptions(
            baseUrl: '',
            connectTimeout: kDebugMode ? Constants.connectTimeout : Constants.prodConnectTimeout,
            receiveTimeout: kDebugMode ? Constants.receiveTimeout : Constants.prodReceiveTimeout,
            sendTimeout: kDebugMode ? Constants.sendTimeout : Constants.prodSendTimeout,
            followRedirects: false),
      );


    } else {
      super.onError(err, handler);
    }
  }




  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
