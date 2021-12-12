import 'package:foodu/controller/base.controller.dart';
import 'package:foodu/controller/pages/explore.controller.dart';
import 'package:foodu/controller/pages/home.controller.dart';
import 'package:foodu/controller/pages/profile.controller.dart';
import 'package:foodu/controller/pages/upload.contoller.dart';
import 'package:get/instance_manager.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController());
    Get.put(() => HomeController());
    Get.lazyPut(() => ExploreController());
    Get.lazyPut(() => UploadController());
    Get.put(() => ProfileController());
  }
}
