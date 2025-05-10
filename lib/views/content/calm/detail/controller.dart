import 'package:get/get.dart';
import 'package:mind_space/config/server_config.dart';
import 'package:mind_space/constants/cache.dart';
import 'package:mind_space/model/result.dart';
import 'package:mind_space/server/api.dart';
import 'package:mind_space/service/cache.dart';

class CalmDetailController extends GetxController {
  /// 呼吸法 id
  int id = 0;

  /// 呼吸法名称
  RxString name = ''.obs;

  /// 呼吸法内容
  RxString content = ''.obs;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    name.value = Get.arguments['name'];
    loadData();
  }

  /// 加载呼吸法详情
  void loadData() async {
    String cacheName = CacheConstants.breatheDetailPrefix + id.toString();
    String cacheContent = CacheService.to.getString(cacheName);
    if (cacheContent.isNotEmpty) {
      content.value = cacheContent;
      return;
    }
    Result<String> result = await Api.getBreatheDetail(id);
    if (ServerConfig.codeSuccess == result.code) {
      CacheService.to.setString(cacheName, result.data!);
      content.value = result.data!;
    } else {
      Get.snackbar("http error", result.msg!);
    }
  }
}