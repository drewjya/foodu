import 'package:foodu/class/recipe.dart';
import 'package:get/get.dart';

class DCategoriesController extends GetxController {
  List<GetRecipe> item = [];
  intit(List<GetRecipe> data) {
    item.addAll(data);
  }
}
