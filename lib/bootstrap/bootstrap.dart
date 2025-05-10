import 'package:mind_space/server/http.dart';
import 'package:mind_space/service/cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Bootstrap {
  /// 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 工具初始化
    await Get.putAsync<CacheService>(() => CacheService().init());
    HttpUtil();
  }
}