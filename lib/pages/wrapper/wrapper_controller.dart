import 'package:foodu/config/routes.dart';
import 'package:foodu/services/auth_services.dart';
import 'package:foodu/services/service.dart';
import 'package:get/get.dart';

class WrapperController extends GetxController {
  AuthService authService = AuthService();
  String test = '';

  checksession() async {
    bool condition = await authService.recoverSession();
    if (condition) {
      Get.put(Service(), permanent: true);
      await Future.delayed(const Duration(milliseconds: 400));
      Get.offAllNamed(Routes.dashboard);
    } else {
      Get.offAllNamed(Routes.landing);
    }
  }

  @override
  void onInit() {
    checksession();
    super.onInit();
  }
}

class WrapperBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WrapperController>(() => WrapperController());
  }
}
