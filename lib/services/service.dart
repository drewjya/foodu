import 'package:flutter/cupertino.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/class/user.dart';
import 'package:foodu/services/recipe_services.dart';
import 'package:foodu/services/user_services.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class Service extends GetxController {
  final RecipeService _recipeService = RecipeService();
  final UserServices _userServices = UserServices();
  final searchController = TextEditingController();
  List<GetRecipe> resepAll = [];
  late List<GetRecipe> favorite;
  late List<GetRecipe> create;
  late UserData user;
  List<String> categories = <String>[
    'Breakfast',
    'Snack',
    'Dinner',
    'Halal',
    'Kosher',
    'Vegetarian',
    'Seafood',
    'Low Fat',
    'Dairy Free',
    'Beverage'
  ];
  Map<String, bool> categoriesExist = <String, bool>{};
  Map<String, dynamic> listCategories = <String, dynamic>{};
  List<IngredientsList> allIngredients = [];

  getAllRecipe() async {
    List<GetRecipe> _result = await _recipeService.getAllRecipe();
    _result.sort((a, b) => a.title.compareTo(b.title));
    return _result;
  }

  Future<UserData?> getRecipeCreator(GetRecipe resep) async {
    return await _userServices.getUser(resep.creator);
  }

  getAllIngredients() async {
    List<IngredientsList> result = await _recipeService.fetchAllIngredients();
    result.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return result;
  }

  List<GetRecipe> getRecipeSugestions(String pattern) {
    if (pattern.isNotEmpty) {
      var first = resepAll
          .where((element) =>
              element.title.toLowerCase().startsWith(pattern.toLowerCase()))
          .toList();
      var second = resepAll
          .where((element) =>
              element.title.toLowerCase().contains(pattern) &&
              !element.title.toLowerCase().startsWith(pattern))
          .toList()
        ..sort(
            (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
      return [...first, ...second].take(5).toList();
    } else {
      return [];
    }
  }

  getCategoriesExist() {
    for (String item in categories) {
      Map<bool, List<GetRecipe>> data = groupBy(
          resepAll, (GetRecipe resep) => resep.categories.contains(item));
      data.forEach((key, value) {
        if (key) {
          categoriesExist[item] = key;
        }
        listCategories[item] = data;
      });
    }
    update();
  }

  getFavorites() async {
    List<GetRecipe> result = await _recipeService.getFavoritedRecipe(user.id);
    return result;
  }

  getCreate() async {
    List<GetRecipe> result = await _recipeService.getCreatedRecipe(user.id);
    return result;
  }

  getCurrentUser() async {
    UserData _user = await _userServices.getCurrentUser();
    return _user;
  }

  bool isFavorit = false;
  isFavorited(GetRecipe resep) {
    for (var item in favorite) {
      if (item.id.isEqual(resep.id)) {
        isFavorit = true;
        return true;
      }
    }
    isFavorit = false;
    return false;
  }

  updateFavorite(GetRecipe resep) async {
    if (!isFavorit) {
      resep.favorited.add(user.id);
      favorite.add(resep);
    } else {
      resep.favorited.remove(user.id);
      favorite.removeWhere((element) => element.id.isEqual(resep.id));
    }
    isFavorit = !isFavorit;
    update();
    await _recipeService.updateFavorite(
        idrecipe: resep.id, newfavorite: resep.favorited);
  }

  @override
  void onInit() async {
    resepAll = await getAllRecipe();
    update();
    user = await getCurrentUser();
    update();
    favorite = await getFavorites();
    update();
    create = await getCreate();
    update();
    getCategoriesExist();
    update();
    allIngredients = await getAllIngredients();
    update();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
