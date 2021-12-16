import 'package:foodu/pages/dashboard/upload/upload_controller.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selected = 0.obs;
  getItem(int value) {
    selected = value.obs;
    update();
  }
}

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<UploadController>(() => UploadController());
  }
}
