import 'package:get/get.dart';
import 'controller.dart';

class FocusDetailBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(FocusDetailController());
  }
}