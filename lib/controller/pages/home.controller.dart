import 'package:foodu/class/recipe.dart';
import 'package:foodu/constants/data.dart';
import 'package:foodu/service/backend.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class HomeController extends GetxController {
  
  RxString textfieldString = ''.obs;
  RxList<GetRecipe> recipeList = <GetRecipe>[].obs;
  RxList<String> recipeName = <String>[].obs;

  void fetchRecipeAll() async {
    var recipes = await ApiHelper.fetchRecipe();
    if (recipes != null) {
      recipeList.value = recipes;
      recipeList.sort((a, b) => a.title.compareTo(b.title));
      for (var element in recipeList) {
        recipeName.add(element.title);
        
      }
    }
    categoriesExist();
  }

  RxList<String> categories = dataCateg.obs;
  RxMap<String, bool> exist = <String, bool>{}.obs;
  RxMap<String, dynamic> newcateg = <String, dynamic>{}.obs;

  void categoriesExist() {
    for (String item in categories) {
      var data = groupBy(
          recipeList, (GetRecipe resep) => resep.categories.contains(item));
      data.forEach((key, value) {
        if (key) {
          exist[item] = key;
          newcateg[item] = data[key];
        }
      });
    }
  }

  @override
  onInit() {
    fetchRecipeAll();

    super.onInit();
  }

  List<GetRecipe> getRecipeSugestions(String query) {
    if (query.isNotEmpty) {
      return recipeList
          .where((recipe) =>
              recipe.title.toLowerCase().contains(query.toLowerCase()))
          .take(5)
          .toList();
    } else {
      return [];
    }
  }
}
