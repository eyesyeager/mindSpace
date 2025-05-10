import 'dart:convert';

import 'package:get/get.dart';
import 'package:mind_space/config/server_config.dart';
import 'package:mind_space/constants/cache.dart';
import 'package:mind_space/model/result.dart';
import 'package:mind_space/model/vo/breathe_list.dart';
import 'package:mind_space/server/api.dart';
import 'package:mind_space/service/cache.dart';

class CalmController extends GetxController {

  RxList<BreatheListVo> breatheList = <BreatheListVo>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadBreatheData();
  }

  /// 加载呼吸法数据
  void loadBreatheData() async {
    List<String> cacheList = CacheService.to.getList(CacheConstants.breatheList);
    if (cacheList.isNotEmpty) {
      breatheList.assignAll(cacheList.map((e) => BreatheListVo.fromJson(jsonDecode(e))).toList());
      return;
    }
    Result<List<String>> result = await Api.getBreatheList();
    if (ServerConfig.codeSuccess == result.code) {
      CacheService.to.setList(CacheConstants.breatheList, result.data!);
      breatheList.assignAll(result.data!.map((e) => BreatheListVo.fromJson(jsonDecode(e))).toList());
    } else {
      Get.snackbar("http error", result.msg!);
    }
  }
}