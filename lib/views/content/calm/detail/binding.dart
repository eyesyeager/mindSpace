import 'package:get/get.dart';
import 'controller.dart';

class CalmDetailBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(CalmDetailController());
  }
}