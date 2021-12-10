import 'package:get/get.dart';

class BaseController extends GetxController {
  int selectedIndex = 0;

  void onChange(int value) {
    selectedIndex = value;
    update();
  }
}
