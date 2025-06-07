import 'package:get/get.dart';
import 'package:mind_space/config/server_config.dart';
import 'package:mind_space/constants/cache.dart';
import 'package:mind_space/constants/context.dart';
import 'package:mind_space/constants/trace.dart';
import 'package:mind_space/model/dto/trace_add.dart';
import 'package:mind_space/model/result.dart';
import 'package:mind_space/model/vo/check_update.dart';
import 'package:mind_space/model/vo/context_list.dart';
import 'package:mind_space/router/app_routes.dart';
import 'package:mind_space/server/api.dart';
import 'package:mind_space/service/cache.dart';
import 'package:mind_space/utils/device_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashController extends GetxController {

  @override
  void onReady() async {
    super.onReady();
    // 添加启动埋点
    _addTrace();
    // 检查应用更新
    _checkUpdate();
    // 加载初始化数据
    await _loadInitData();
    // 跳转到主页面
    Get.offNamed(AppRoutes.index);
  }

  /// 添加启动埋点
  void _addTrace() async {
    // 获取基础信息
    String deviceId = await DeviceInfoUtils.getId();
    String os = await DeviceInfoUtils.getOS();
    String model = await DeviceInfoUtils.getModel();
    // 获取 设备 与 版本 数据
    String deviceInfo = await DeviceInfoUtils.getInfo();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // 发送埋点
    Api.addTrace(data: TraceAddDto(
        key: TraceConstants.boot,
        content: "deviceInfo: $deviceInfo; packageInfo: $packageInfo",
        deviceId: deviceId,
        os: os,
        model: model)
    );
  }

  /// 检查应用更新
  void _checkUpdate() async {
    Result<CheckUpdateVo> result = await Api.checkUpdate();
    // 若请求失败则略过更新检查
    if (result.code != ServerConfig.codeSuccess) {
      return;
    }
    // 若版本一致则略过
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (packageInfo.version == result.data!.version) {
      return;
    }
    // 携带安装包地址跳转更新页面
    Get.offNamed(AppRoutes.update, arguments: {
      ContextConstants.updateUrl: result.data!.updateUrl
    });
  }

  /// 加载初始化数据
  Future<void> _loadInitData() async {
    // 加载本地缓存数据
    Map<String, dynamic> initDataMap = CacheService.to.getJson(CacheConstants.initData);
    if (initDataMap.isNotEmpty) {
      // 检查数据版本
      String currentVersion = initDataMap[ContextConstants.initContextVersion];
      Result<bool> result = await Api.checkInitContext(currentVersion);
      // 若请求失败，则略过
      if (result.code != ServerConfig.codeSuccess) {
        return;
      }
      // 若判断为true，则不更新缓存
      if (result.data!) {
        return;
      }
    }
    // 加载云端数据
    Result<List<ContextListVo>> result = await Api.getInitContextList();
    if (result.code != ServerConfig.codeSuccess) {
      // 进入异常页面
      Get.offNamed(AppRoutes.error);
      return;
    }
    Map<String, String> newInitDataMap = Map<String, String>.from({});
    for (ContextListVo contextListVO in result.data!) {
      newInitDataMap[contextListVO.code] = contextListVO.value;
    }
    await CacheService.to.setJson(CacheConstants.initData, newInitDataMap);
  }
}