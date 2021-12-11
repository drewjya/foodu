import 'package:foodu/class/recipe.dart';
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
}
