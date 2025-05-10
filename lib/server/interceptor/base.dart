import 'package:mind_space/config/app_config.dart';
import 'package:mind_space/utils/crypto.dart';
import 'package:mind_space/utils/device_info.dart';
import 'package:dio/dio.dart';

class BaseInterceptor extends Interceptor  {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 设备标识
    String deviceId = await DeviceInfoUtils.getId();
    options.headers[AppConfig.headerDeviceId] = deviceId;
    // 当前时间
    int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    options.headers[AppConfig.headerCurrentTime] = timestamp;
    // token
    String token = CryptoUtils.toMd5(deviceId + timestamp.toString());
    options.headers[AppConfig.headerToken] = token;
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 特殊异常码处理
    return handler.next(response);
  }

  @override
  void onError(DioError e, ErrorInterceptorHandler handler) {
    // 错误处理
    return handler.next(e);
  }
}