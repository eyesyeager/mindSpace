import 'package:mind_space/config/server_config.dart';
import 'package:mind_space/server/interceptor/base.dart';
import 'package:mind_space/server/interceptor/net_cache.dart';
import 'package:dio/dio.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio _dio;

  HttpUtil._internal() {
    // 基础设置
    final BaseOptions options = BaseOptions(
      baseUrl: ServerConfig.baseApiUrl,
      connectTimeout: ServerConfig.connectTimeout,
      receiveTimeout: ServerConfig.receiveTimeout,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    // 实例化 _dio
    _dio = Dio(options);
    // 添加拦截器
    _dio.interceptors.add(BaseInterceptor());
    _dio.interceptors.add(NetCache());
  }

  /// GET 请求封装
  Future get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    var response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }

  /// POST 请求封装
  Future<dynamic> post(
      String path, {
        dynamic data,
        Options? options,
      }) async {
    var response = await _dio.post(
      path,
      data: data,
      options: options,
    );
    return response.data;
  }
}
