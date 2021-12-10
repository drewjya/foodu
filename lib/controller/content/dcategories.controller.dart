import 'package:foodu/class/recipe.dart';
import 'package:get/get.dart';

class DCategoriesController extends GetxController {
  List<GetRecipe> item = [];
  intit(Map<bool, List<GetRecipe>> data) {
    if (data[true] != null) {
      item.addAll(data[true]!.toList());
    }
  }
}
