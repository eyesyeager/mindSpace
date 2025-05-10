import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind_space/router/app_routes.dart';
import 'package:mind_space/views/content/calm/controller.dart';

class CalmView extends GetView<CalmController> {
  const CalmView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 获取设备宽度和高度
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        // 计算容器宽度和高度
        const double paddingLen = 6;
        const double spaceLen = 10;
        double containerWidth = (screenWidth - paddingLen * 2 - spaceLen) / 2;
        double containerHeight = (screenHeight - paddingLen * 2 - spaceLen * 2) / 3;

        return GridView.builder(
          padding: const EdgeInsets.all(paddingLen),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: spaceLen,
            mainAxisSpacing: spaceLen,
            childAspectRatio: containerWidth / containerHeight,
          ),
          itemCount: controller.breatheList.length,
          itemBuilder: (context, index) {
            var item = controller.breatheList[index];
            return buildBreatheCard(item.id, item.name, item.effect);
          },
        );
      },
    );
  }

  Widget buildBreatheCard(int id, String name, String effect) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.calmDetail, arguments: {
              "id": id,
              "name": name
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text(effect, style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}