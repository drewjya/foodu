import 'package:foodu/class/recipe.dart';
import 'package:foodu/class/user.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'config.dart';

class ApiHelper {
  static SupabaseClient supabase =
      SupabaseClient(supabaseUrl, supabaseAnnonKey);
  static Future<List<GetRecipe>?> fetchRecipe() async {
    var response = await supabase.from('recipe').select().execute();
    if (response.error == null) {
      var json = response.data;
      List<GetRecipe> recipe = [];
      for (var item in json) {
        recipe.add(GetRecipe.fromJson(json: item));
      }
      return recipe;
    } else {
      //show error
      return null;
    }
  }

  static Future fetchIngredients() async {
    var response = await supabase.from('ingredients').select().execute();
    if (response.error == null) {
      var items = response.data;
      List<IngredientsList> ingredientList = [];
      for (var json in items) {
        ingredientList.add(IngredientsList.fromJson(json: json));
      }
      return ingredientList;
    }
    return null;
  }

  //d8c976b7-82d6-4ef3-bd8b-28789075684c
  static Future<UserData?> fetchUser({required String userid}) async {
    var response = await supabase
        .from('users')
        .select()
        .eq('id', userid)
        .limit(1)
        .execute();
    if (response.error == null) {
      return UserData.fromJson(json: response.data[0]);
    }

    return null;
  }

  static Future<GetRecipe?> updateFavorite(
      {required int idrecipe, required newfavorited}) async {
    var response = await supabase
        .from('recipe')
        .update({'favorited': newfavorited})
        .eq('id', idrecipe)
        .execute();
    print(response.error);
    if (response.error == null) {
      var resep =
          await supabase.from('recipe').select().eq('id', idrecipe).execute();
      return GetRecipe.fromJson(json: resep.data[0]);
    }
    return null;
  }
}
