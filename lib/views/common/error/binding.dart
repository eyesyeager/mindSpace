import 'package:get/get.dart';
import 'controller.dart';

class ErrorBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(ErrorController());
  }
}