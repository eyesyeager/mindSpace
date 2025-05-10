import 'dart:convert';

import 'package:get/get.dart';
import 'package:mind_space/config/server_config.dart';
import 'package:mind_space/constants/cache.dart';
import 'package:mind_space/model/result.dart';
import 'package:mind_space/model/vo/noise_list.dart';
import 'package:mind_space/router/app_routes.dart';
import 'package:mind_space/server/api.dart';
import 'package:mind_space/service/cache.dart';

class FocusController extends GetxController {

  var noiseList = <NoiseListVo>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadNoiseListData();
  }

  /// 加载白噪音列表数据
  void loadNoiseListData() async {
    // 获取白噪音列表
    List<String> noiseJsonList = CacheService.to.getList(CacheConstants.noiseList);
    if (noiseJsonList.isEmpty) {
      Result<List<String>> result = await Api.getNoiseList();
      if (ServerConfig.codeSuccess == result.code) {
        noiseJsonList = result.data!;
        CacheService.to.setList(CacheConstants.noiseList, result.data!);
      } else {
        Get.snackbar("白噪音列表获取失败！", result.msg!);
        return;
      }
    }
    List<NoiseListVo> noiseVoList = noiseJsonList.map((e) => NoiseListVo.fromJson(jsonDecode(e))).toList();
    // 处理置顶逻辑
    List<NoiseListVo> noiseResList = [];
    List<String> starList = CacheService.to.getList(CacheConstants.noiseStar);
    int starSize = starList.length;
    for (int i = starList.length - 1; i >= 0; i--) {
      String starId = starList[i];
      bool hasStar = false;
      for (NoiseListVo item in noiseVoList) {
        if (item.id.toString() == starId) {
          noiseResList.add(item);
          hasStar = true;
          break;
        }
      }
      if (!hasStar) {
        starList.removeAt(i - 1);
      }
    }
    // 更新置顶数据
    if (starSize != 0 && starSize != starList.length) {
      CacheService.to.setList(CacheConstants.noiseStar, starList);
    }
    // 处理未置顶逻辑
    for (NoiseListVo item in noiseVoList) {
      bool hasStar = false;
      for (String starId in starList) {
        if (starId == item.id.toString()) {
          hasStar = true;
          break;
        }
      }
      if (!hasStar) {
        noiseResList.add(item);
      }
    }
    noiseList.assignAll(noiseResList);
  }

  /// 跳转到详情页
  void jumpDetail(int id, String word, String imgUrl) {
    Get.toNamed(AppRoutes.focusDetail, arguments: {
      "id": id,
      "word": word,
      "imgUrl": imgUrl,
    });
  }
}