import 'package:foodu/controller/content/dcategories.controller.dart';
import 'package:get/instance_manager.dart';

class DecontBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DCategoriesController());
  }
}
