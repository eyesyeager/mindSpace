import 'dart:io';
import 'package:mind_space/constants/cache.dart';
import 'package:mind_space/service/cache.dart';
import 'package:mind_space/utils/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoUtils {

  static final _deviceInfo = DeviceInfoPlugin();

  /// 获取完整设备信息
  static Future<String> getInfo() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.toString();
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.toString();
    }
    final deviceInfo = await _deviceInfo.deviceInfo;
    return "unknown-${deviceInfo.data}";
  }

  /// 获取设备唯一标识
  static Future<String> getId() async {
    String deviceId = CacheService.to.getString(CacheConstants.deviceId);
    if (deviceId.isNotEmpty) {
      return deviceId;
    }
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      var iosId = iosInfo.identifierForVendor;
      if (iosId != null) {
        deviceId = iosId;
      }
    }
    if (deviceId.isEmpty) {
      String deviceInfo = await getInfo();
      deviceId = "unknown-${CryptoUtils.toMd5(deviceInfo)}";
    }
    CacheService.to.setString(CacheConstants.deviceId, deviceId);
    return deviceId;
  }

  /// 获取设备操作系统信息
  static Future<String> getOS() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return "Android ${androidInfo.version.release} (SDK ${androidInfo.version.sdkInt})";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return "iOS ${iosInfo.systemVersion}";
    }
    return "unknown";
  }

  /// 获取设备型号
  static Future<String> getModel() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return "${androidInfo.brand} ${androidInfo.model}";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.model;
    }
    return "unknown";
  }
}