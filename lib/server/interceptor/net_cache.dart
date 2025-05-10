import 'package:dio/dio.dart';

class NetCache extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError e, ErrorInterceptorHandler handler) {
    return handler.next(e);
  }
}