import 'package:foodu/controller/pages/upload.contoller.dart';
import 'package:get/get.dart';


class UploadsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadController());
  }
}
