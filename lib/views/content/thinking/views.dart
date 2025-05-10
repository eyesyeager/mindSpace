import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mind_space/router/app_routes.dart';
import 'controller.dart';

class ThinkingView extends GetView<ThinkingController> {

  const ThinkingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: controller.scrollController,
        itemCount: controller.mottoList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: ListTile(
              title: Text(controller.mottoList[index].title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.mottoList[index].summary),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        controller.mottoList[index].labels.join(' '),
                        style: TextStyle(fontSize: 12, color: Colors.grey)
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.toNamed(AppRoutes.thinkingDetail, arguments: controller.mottoList[index].id);
              },
            ),
          );
        },
      );
    });
  }
}