import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mind_space/config/server_config.dart';
import 'package:mind_space/model/result.dart';
import 'package:mind_space/model/vo/motto_List.dart';
import 'package:mind_space/server/api.dart';

class ThinkingController extends GetxController {
  /// 页码
  RxInt pageIndex = 0.obs;

  /// 格言列表
  final RxList<MottoListVo> mottoList = <MottoListVo>[].obs;

  /// 滚动控制器
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    // 加载下拉监听
    scrollController.addListener(loadMoreData);
    // 加载初始数据
    loadThinkingData();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  /// 加载数据
  void loadThinkingData() async {
    Result<List<MottoListVo>> result = await Api.getMottoList(pageIndex.value);
    if (ServerConfig.codeSuccess == result.code) {
      if (result.data!.isEmpty) {
        Get.snackbar("没有更多数据了", "");
        return;
      }
      mottoList.addAll(result.data!);
      pageIndex.value++;
    } else {
      Get.snackbar("http error", result.msg!);
      return;
    }
  }

  /// 下拉刷新
  void loadMoreData() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      loadThinkingData();
    }
  }
}