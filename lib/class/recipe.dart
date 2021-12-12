part 'recipe.g.dart';
class Recipe {
  final String title;
  final String creator;
  final String cookingtime;
  final String info;
  final String imglink;
  final String serving;
  final List<dynamic> tutorial, categories;
  final String calories;
  final String fat;
  final DateTime created;
  final String carbs;
  final String protein;
  final List<Data> ingredients;
  Recipe({
    required this.title,
    required this.info,
    required this.creator,
    required this.imglink,
    required this.cookingtime,
    required this.ingredients,
    required this.tutorial,
    required this.categories,
    required this.serving,
    required this.protein,
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.created,
  });
  factory Recipe.fromJson({required Map<String, dynamic> json}) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

class GetRecipe {
  final int id;
  final String title;
  final String creator;
  final String cookingtime;
  final String info;
  final String imglink;
  final String serving;
  final List<dynamic> tutorial, categories, favorited;
  final String calories;
  final String fat;
  final DateTime created;
  final String carbs;
  final String protein;
  final List<Data> ingredients;
  GetRecipe({
    required this.favorited,
    required this.id,
    required this.title,
    required this.info,
    required this.creator,
    required this.imglink,
    required this.cookingtime,
    required this.ingredients,
    required this.tutorial,
    required this.categories,
    required this.serving,
    required this.protein,
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.created,
  });
  factory GetRecipe.fromJson({required Map<String, dynamic> json}) =>
      _$GetRecipeFromJson(json);
  Map<String, dynamic> toJson() => _$GetRecipeToJson(this);
}

class CaloriesSource {
  final String calories;
  final String protein;
  final String fat;
  final String carbs;
  CaloriesSource({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
  });
  factory CaloriesSource.fromJson({required Map<String, dynamic> json}) =>
      _$CaloriesSourceFromJson(json);
  Map<String, dynamic> toJson() => _$CaloriesSourceToJson(this);
}


class InputRecipe {
  final String title;
  final String info;
  final String creator;
  final String imglink;
  final String cookingtime;
  final String serving;
  final List<String> tutorial;
  final List<String> categories;
  final List<Data> ingredients;
  InputRecipe(
      {required this.title,
      required this.info,
      required this.creator,
      required this.imglink,
      required this.cookingtime,
      required this.serving,
      required this.tutorial,
      required this.categories,
      required this.ingredients});
  factory InputRecipe.fromJson({required Map<String, dynamic> json}) =>
      _$InputRecipeFromJson(json);
  Map<String, dynamic> toJson() => _$InputRecipeToJson(this);
}


class Ingreepek {
  final List<Data> ingredients;
  Ingreepek({
    required this.ingredients,
  });
  factory Ingreepek.fromJson({required Map<String, dynamic> json}) =>
      _$IngreepekFromJson(json);
  Map<String, dynamic> toJson() => _$IngreepekToJson(this);
}


class Data {
  final String name;
  final int quantity;
  final String unit;
  Data({
    required this.name,
    required this.quantity,
    required this.unit,
  });
  factory Data.fromJson({required Map<String, dynamic> json}) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}


class IngredientsList {
  final int id;
  String name;
  final String imglink;
  final List<String> units;
  IngredientsList({
    required this.id,
    required this.name,
    required this.imglink,
    required this.units,
  });
  factory IngredientsList.fromJson({required Map<String, dynamic> json}) =>
      _$IngredientsListFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientsListToJson(this);
}
