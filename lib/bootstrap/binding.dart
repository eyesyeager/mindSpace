
import 'package:get/get.dart';
import 'package:mind_space/views/content/calm/controller.dart';
import 'package:mind_space/views/content/focus/controller.dart';
import 'package:mind_space/views/content/thinking/controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FocusController());
    Get.put(CalmController());
    Get.put(ThinkingController());
  }
}