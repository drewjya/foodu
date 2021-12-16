import 'package:flutter/material.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/services/service.dart';
import 'package:get/get.dart';

class ContentController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTab = <Tab>[
    Tab(
      text: 'Ingredients'.toUpperCase(),
    ),
    Tab(
      text: 'Directions'.toUpperCase(),
    ),
    Tab(
      text: 'Nutritions'.toUpperCase(),
    ),
  ];
  late TabController tabController;
  final _profile = Get.find<Service>();
  late bool isFavorite = false;
  // late String creator;

  updateFavorite(GetRecipe resep) {
    _profile.updateFavorite(resep);
    isFavorite = !isFavorite;
    update();
  }

  String creator = "";

  recipeCreator(GetRecipe resep) async {
    var response = await _profile.getRecipeCreator(resep);
    if (response != null) {
      creator = response.username;
      update();
    } else {
      creator = "Guest";
      update();
    }
  }

  isFavoriteTrue(GetRecipe resep) {
    isFavorite = _profile.isFavorited(resep);
    update();
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);

    
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

class ContentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContentController>(() => ContentController());
  }
}
