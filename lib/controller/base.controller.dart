import 'package:foodu/class/recipe.dart';
import 'package:foodu/service/config.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  int selectedIndex = 0;
  List<GetRecipe> allrecipe = [];
  void onChange(int value) {
    selectedIndex = value;
    update();
  }
}
