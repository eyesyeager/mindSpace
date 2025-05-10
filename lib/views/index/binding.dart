import 'package:get/get.dart';
import 'controller.dart';

class IndexBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(IndexController());
  }
}