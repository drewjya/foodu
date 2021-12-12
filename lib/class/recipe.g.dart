// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      protein: json['protein'] as String,
      calories: json['calories'] as String,
      carbs: json['carbs'] as String,
      creator: json['creator'] as String,
      cookingtime: json['cookingtime'] as String,
      info: json['info'] as String,
      fat: json['fat'] as String,
      imglink: json['imglink'] as String,
      tutorial: json['tutorial'] as List<dynamic>,
      title: json['title'] as String,
      serving: json['serving'] as String,
      created: DateTime.parse(json['created'] as String),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Data.fromJson(json: e as Map<String, dynamic>))
          .toList(),
      categories: json['categories'] as List<dynamic>,
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'title': instance.title,
      'info': instance.info,
      'creator': instance.creator,
      'imglink': instance.imglink,
      'calories': instance.calories,
      'fat': instance.fat,
      'carbs': instance.carbs,
      'protein': instance.protein,
      'cookingtime': instance.cookingtime,
      'serving': instance.serving,
      'created': instance.created.toIso8601String(),
      'ingredients': instance.ingredients
          .map((e) =>
              Data(name: e.name, quantity: e.quantity, unit: e.unit).toJson())
          .toList(),
      'tutorial': instance.tutorial,
      'categories': instance.categories,
    };
GetRecipe _$GetRecipeFromJson(Map<String, dynamic> json) => GetRecipe(
      favorited: json['favorited'] as List<dynamic>,
      id: json['id'] as int,
      protein: json['protein'] as String,
      calories: json['calories'] as String,
      carbs: json['carbs'] as String,
      creator: json['creator'] as String,
      cookingtime: json['cookingtime'] as String,
      info: json['info'] as String,
      fat: json['fat'] as String,
      imglink: json['imglink'] as String,
      tutorial: json['tutorial'] as List<dynamic>,
      title: json['title'] as String,
      serving: json['serving'] as String,
      created: DateTime.parse(json['created'] as String),
      ingredients: (json['ingredients'])
          .map<Data>((e) => Data.fromJson(json: e as Map<String, dynamic>))
          .toList(),
      categories: json['categories'] as List<dynamic>,
    );

Map<String, dynamic> _$GetRecipeToJson(GetRecipe instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'info': instance.info,
      'creator': instance.creator,
      'imglink': instance.imglink,
      'calories': instance.calories,
      'fat': instance.fat,
      'carbs': instance.carbs,
      'protein': instance.protein,
      'cookingtime': instance.cookingtime,
      'serving': instance.serving,
      'created': instance.created.toIso8601String(),
      'ingredients': instance.ingredients
          .map((e) =>
              Data(name: e.name, quantity: e.quantity, unit: e.unit).toJson())
          .toList(),
      'tutorial': instance.tutorial,
      'categories': instance.categories,
      'favorited': instance.favorited,
    };

InputRecipe _$InputRecipeFromJson(Map<String, dynamic> json) => InputRecipe(
      title: json['title'] as String,
      info: json['info'] as String,
      creator: json['creator'] as String,
      imglink: json['imglink'] as String,
      cookingtime: json['cookingtime'] as String,
      serving: json['serving'] as String,
      tutorial:
          (json['tutorial'] as List<dynamic>).map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      ingredients: (json['ingredients'] as List<Map<String, dynamic>>)
          .map((e) => Data.fromJson(json: e))
          .toList(),
    );

Map<String, dynamic> _$InputRecipeToJson(InputRecipe instance) =>
    <String, dynamic>{
      'title': instance.title,
      'info': instance.info,
      'creator': instance.creator,
      'imglink': instance.imglink,
      'cookingtime': instance.cookingtime,
      'serving': instance.serving,
      'tutorial': instance.tutorial,
      'categories': instance.categories,
      'ingredients': instance.ingredients
          .map((e) =>
              Data(name: e.name, quantity: e.quantity, unit: e.unit).toJson())
          .toList(),
    };

Ingreepek _$IngreepekFromJson(Map<String, dynamic> json) => Ingreepek(
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Data.fromJson(json: e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IngreepekToJson(Ingreepek instance) => <String, dynamic>{
      'ingredients': instance.ingredients
          .map((e) =>
              Data(name: e.name, quantity: e.quantity, unit: e.unit).toJson())
          .toList(),
    };

CaloriesSource _$CaloriesSourceFromJson(Map<String, dynamic> json) =>
    CaloriesSource(
        fat: json['Total Fat'],
        calories: json['Calories'] + "al",
        carbs: json['Carbs'],
        protein: json['Protein']);
Map<String, dynamic> _$CaloriesSourceToJson(CaloriesSource instance) =>
    <String, dynamic>{
      'Total Fat': instance.fat,
      'Carbs': instance.carbs,
      'Protein': instance.protein,
      'Calories': instance.calories,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'unit': instance.unit,
    };

IngredientsList _$IngredientsListFromJson(Map<String, dynamic> json) =>
    IngredientsList(
      id: json['id'] as int,
      name: json['name'] as String,
      imglink: json['imglink'] as String,
      units: (json['units'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$IngredientsListToJson(IngredientsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imglink': instance.imglink,
      'units': instance.units,
    };
