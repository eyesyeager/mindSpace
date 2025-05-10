import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind_space/constants/cache.dart';
import 'package:mind_space/constants/context.dart';
import 'package:mind_space/service/cache.dart';

class IndexController extends GetxController {
  /// 当前选中的索引
  final currentIndex = 0.obs;

  /// 标语列表
  final sloganList = [].obs;

  /// 底部导航栏
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.graphic_eq),
      label: '静心',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.center_focus_weak),
      label: '专注',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.wb_iridescent),
      label: '思维',
    ),
  ];

  /// 跳转页面
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    // 确保 pageController 和 currentIndex 初始化顺序正确
    pageController = PageController(
      initialPage: currentIndex.value,
      keepPage: true,
    );
    // 初始化配置信息
    Map<String, dynamic> initDataJson = CacheService.to.getJson(CacheConstants.initData);
    sloganList.assignAll([
      initDataJson[ContextConstants.calmSlogan],
      initDataJson[ContextConstants.focusSlogan],
      initDataJson[ContextConstants.thinkingSlogan]
    ]);
  }

  @override
  void onClose() {
    // 释放资源
    pageController.dispose();
    super.onClose();
  }

  /// 切换索引
  void changeIndex(int index) {
    print("hhhhhhh: " + index.toString());
    currentIndex.value = index;
    // 切换 PageView 的页面
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}