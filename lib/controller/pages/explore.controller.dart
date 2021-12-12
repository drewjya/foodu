import 'package:foodu/class/recipe.dart';
import 'package:foodu/constants/data.dart';
import 'package:foodu/service/backend.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class ExploreController extends GetxController {
  List categories = dataCateg;
  Map<String, dynamic> categori = <String, dynamic>{};
  List<GetRecipe> listRecipe = [];

  getCategories() {
    for (var item in categories) {
      var data = groupBy(
          listRecipe, (GetRecipe enak) => enak.categories.contains(item));
      categori[item] = data;
    }
  }

  getRecipe() async {
    var recipes = await ApiHelper.fetchRecipe();
    if (recipes != null) {
      listRecipe.addAll(recipes);
      listRecipe.sort((a, b) => a.title.compareTo(b.title));
    }
    getCategories();
  }

  @override
  void onInit() {
    categories.sort();
    getRecipe();
    super.onInit();
  }
}
