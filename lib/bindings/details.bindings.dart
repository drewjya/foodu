import 'package:foodu/controller/content/details.controller.dart';
import 'package:get/instance_manager.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailsController());
  }
}
