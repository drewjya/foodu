import 'package:foodu/controller/content/seeall.controller.dart';
import 'package:get/get.dart';

class SeeAllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeeAllCont());
  }
}
