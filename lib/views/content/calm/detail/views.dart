import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'controller.dart';

class CalmDetailView extends GetView<CalmDetailController> {

  const CalmDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(controller.name.value)),
        ),
        body: Obx(() {
          return Markdown(data: controller.content.value);
        })
    );
  }
}