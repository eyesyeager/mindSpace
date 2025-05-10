import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind_space/views/content/calm/views.dart';
import 'package:mind_space/views/content/focus/views.dart';
import 'package:mind_space/views/content/thinking/views.dart';
import 'controller.dart';

class IndexView extends GetView<IndexController> {

  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => Text(
            controller.sloganList[controller.currentIndex.value],
            style: TextStyle(fontSize: 14))),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          CalmView(),
          FocusView(),
          ThinkingView()
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        items: controller.items,
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeIndex,
      )),
    );
  }
}