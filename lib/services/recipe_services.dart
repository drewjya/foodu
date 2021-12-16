import 'dart:developer';
import 'dart:io';

import 'package:foodu/class/recipe.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RecipeService {
  final _client = Get.find<SupabaseClient>();
  static const recipe = 'recipe';
  Future<List<GetRecipe>> getAllRecipe() async {
    final response = await _client.from(recipe).select().execute();
    if (response.error == null) {
      final result = response.data as List<dynamic>;
      return result.map((e) => GetRecipe.fromJson(json: e)).toList();
    }
    return [];
  }

  Future insertRecipe(Recipe resep) async {
    final response =
        await _client.from(recipe).insert(resep.toJson()).execute();
    print(response.data);
  }

  Future uploadImageRecipe(String imagename, File image) async {
    final response =
        await _client.storage.from('recipeimg').upload(imagename, image);
    final url = _client.storage.from('recipeimg').getPublicUrl(imagename);
    return url.data;
  }

  Future<List<GetRecipe>> getFavoritedRecipe(String id) async {
    final response = await _client
        .from(recipe)
        .select()
        .contains('favorited', [id]).execute();
    if (response.error == null) {
      final result = response.data as List<dynamic>;
      return result.map((e) => GetRecipe.fromJson(json: e)).toList();
    }
    return [];
  }

  Future<List<GetRecipe>> getCreatedRecipe(String id) async {
    final response =
        await _client.from(recipe).select().eq('creator', id).execute();
    if (response.error == null) {
      final result = response.data as List<dynamic>;
      return result.map((e) => GetRecipe.fromJson(json: e)).toList();
    }
    return [];
  }

  Future updateFavorite({required int idrecipe, required newfavorite}) async {
    final response = await _client
        .from(recipe)
        .update({'favorited': newfavorite})
        .eq('id', idrecipe)
        .execute();
    if (response.error == null) {
      var resep =
          await _client.from(recipe).select().eq('id', idrecipe).execute();
      return GetRecipe.fromJson(json: resep.data[0]);
    }
    print(response.error!.message);
  }

  Future fetchAllIngredients() async {
    final response = await _client.from('ingredients').select().execute();
    if (response.error == null) {
      var items = response.data as List;
      return items.map((e) => IngredientsList.fromJson(json: e)).toList();
    }
    return [];
  }
}
