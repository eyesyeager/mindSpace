import 'package:get/get.dart';
import 'package:mind_space/config/server_config.dart';
import 'package:mind_space/model/result.dart';
import 'package:mind_space/model/vo/MottoDetailVo.dart';
import 'package:mind_space/server/api.dart';

class ThinkingDetailController extends GetxController {

  RxString title = "".obs;

  RxString content = "".obs;

  @override
  void onReady() {
    super.onReady();
    loadMottoDetail(Get.arguments);
  }

  /// 加载格言详情
  void loadMottoDetail(int id) async {
    Result<MottoDetailVo> result = await Api.getMottoDetail(id);
    if (ServerConfig.codeSuccess == result.code) {
      title.value = result.data!.title;
      content.value = result.data!.content;
    } else {
      Get.snackbar("http error", result.msg!);
    }
  }
}