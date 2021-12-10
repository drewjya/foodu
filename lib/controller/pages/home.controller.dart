import 'package:flutter/widgets.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/constants/data.dart';
import 'package:foodu/service/routes.dart';
import 'package:collection/collection.dart';
import 'package:foodu/view/pages/resep.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final TextEditingController searchRecipe;
  List<GetRecipe> listRecipe = [];

  getRecipe() {
    for (var item in data) {
      listRecipe.add(GetRecipe.fromJson(json: item));
    }
  }

  List categories = dataCateg;
  Map<String, dynamic> categori = Map<String, dynamic>();
  getCategories() {
    for (var item in categories) {
      var data = groupBy(
          listRecipe, (GetRecipe enak) => enak.categories.contains(item));
      categori[item] = data;
    }
  }

  onSugestion(sugestion) {
    for (var item in listRecipe) {
      if (item.title == sugestion) {
        Get.toNamed(Routes.details, arguments: item);
      }
    }
    searchRecipe.clear();
  }

  List<String> getSugestions(String query) {
    List<String> matches = [];
    if (query.isNotEmpty) {
      matches.addAll(listRecipe.map((e) => e.title).toList());
      matches.retainWhere(
          (element) => element.toLowerCase().contains(query.toLowerCase()));
      return matches;
    }
    return [''];
  }

  @override
  void onInit() async {
    searchRecipe = TextEditingController();
    getRecipe();
    await getCategories();
    super.onInit();
  }
}
