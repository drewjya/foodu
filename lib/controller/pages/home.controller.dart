import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/constants/data.dart';
import 'package:foodu/service/backend.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class HomeController extends GetxController {
  late TextEditingController searchRecipe;
  RxString textfieldString = ''.obs;
  RxList<GetRecipe> recipeList = <GetRecipe>[].obs;

  void fetchRecipeAll() async {
    var recipes = await ApiHelper.fetchRecipe();
    if (recipes != null) {
      recipeList.value = recipes;
    }
    recipeList.sort((a, b) => a.title.compareTo(b.title));
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
    searchRecipe = TextEditingController();
    searchRecipe.addListener(() {
      textfieldString.value = searchRecipe.text;
      debugPrint(textfieldString.value);
    });
    fetchRecipeAll();

    super.onInit();
  }
  // getRecipe() {
  //   for (var item in data) {
  //     allRecipe.add(GetRecipe.fromJson(json: item));
  //   }
  //   for (var all in allRecipe.getRange(0, 3)) {
  //     listRecipe.add(all);
  //   }
  // }

  // List categories = dataCateg;

  // Map<String, bool> exist = <String, bool>{};
  // Map<String, dynamic> newCateg = <String, dynamic>{};

  // getExistorNot() {
  //   for (String item in categories) {
  //     var data = groupBy(
  //         allRecipe, (GetRecipe enak) => enak.categories.contains(item));
  //     data.forEach((key, value) {
  //       if (key) {
  //         exist[item] = key;
  //         newCateg[item] = data[key];
  //       }
  //     });
  //   }
  // }

  onSugestion(sugestion) {
    // for (var item in allRecipe) {
    //   if (item.title == sugestion) {
    //     Get.toNamed(Routes.details, arguments: item);
    //   }
    // }
    // searchRecipe.clear();
  }

  List<String> getSugestions(String query) {
    List<String> matches = [];
    if (query.isNotEmpty) {
      // matches.addAll(allRecipe.map((e) => e.title).toList());
      // matches.retainWhere(
      //     (element) => element.toLowerCase().contains(query.toLowerCase()));
      // return matches;
    }
    return [''];
  }
}
