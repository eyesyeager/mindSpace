import 'package:get/get.dart';
import 'controller.dart';

class UpdateBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(UpdateController());
  }
}