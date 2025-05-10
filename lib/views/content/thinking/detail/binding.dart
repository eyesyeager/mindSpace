import 'package:get/get.dart';
import 'controller.dart';

class ThinkingDetailBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ThinkingDetailController());
  }
}