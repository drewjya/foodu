import 'package:foodu/class/recipe.dart';
import 'package:get/get.dart';

class DCategoriesController extends GetxController {
  List<GetRecipe> item = [];
  RxBool setCondition = false.obs;
  intit(List<GetRecipe> data) {
    item.addAll(data);
  }
}
