import 'package:foodu/class/recipe.dart';
import 'package:foodu/constants/data.dart';
import 'package:foodu/view/pages/resep.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class ExploreController extends GetxController {
  List categories = dataCateg;
  Map<String, dynamic> categori = <String, dynamic>{};
  List<GetRecipe> listRecipe = [];

  getRecipe() {
    for (var item in data) {
      listRecipe.add(GetRecipe.fromJson(json: item));
    }
  }

  getCategories() {
    for (var item in categories) {
      var data = groupBy(
          listRecipe, (GetRecipe enak) => enak.categories.contains(item));
      categori[item] = data;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getRecipe();
    insertionSort(categories);
    getCategories();
    super.onInit();
  }
}
