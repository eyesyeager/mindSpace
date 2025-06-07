sealed class ServerConfig {
  /// 服务器base地址
  static const String baseApiUrl = 'http://api.mindspace.eyescode.top';

  /// 连接服务器超时时间
  static const Duration connectTimeout = Duration(milliseconds: 10000);

  /// 响应流上前后两次接受到数据的间隔
  static const Duration receiveTimeout = Duration(milliseconds: 5000);

  /// 状态码 - 成功
  static const int codeSuccess = 200;
}