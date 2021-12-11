import 'package:flutter/widgets.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/constants/data.dart';
import 'package:foodu/service/routes.dart';
import 'package:collection/collection.dart';
import 'package:foodu/view/pages/resep.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  late final TextEditingController searchRecipe;
  List<GetRecipe> listRecipe = [];
  List<GetRecipe> allRecipe = [];
  getAllRecipe() async {
    var config = Get.find<SupabaseClient>();
    final recipe = await config.from('recipe').select().execute();
    if (recipe.error == null) {
      for (var item in recipe.data) {
        allRecipe.add(GetRecipe.fromJson(json: item));
      }
      for (var all in allRecipe.getRange(0, 3)) {
        listRecipe.add(all);
      }
    }
  }

  List categories = dataCateg;

  Map<String, bool> exist = Map<String, bool>();
  Map<String, dynamic> newCateg = Map();
  getExistorNot() {
    for (String item in categories) {
      var data = groupBy(
          allRecipe, (GetRecipe enak) => enak.categories.contains(item));
      data.forEach((key, value) {
        if (key) {
          exist[item] = key;
          newCateg[item] = data[key];
        }
      });
    }
  }

  onSugestion(sugestion) {
    for (var item in allRecipe) {
      if (item.title == sugestion) {
        Get.toNamed(Routes.details, arguments: item);
      }
    }
    searchRecipe.clear();
  }

  List<String> getSugestions(String query) {
    List<String> matches = [];
    if (query.isNotEmpty) {
      matches.addAll(allRecipe.map((e) => e.title).toList());
      matches.retainWhere(
          (element) => element.toLowerCase().contains(query.toLowerCase()));
      return matches;
    }
    return [''];
  }

  @override
  void onInit() async {
    searchRecipe = TextEditingController();
    getAllRecipe();
    await getExistorNot();
    super.onInit();
  }
}
