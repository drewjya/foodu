import 'package:foodu/class/recipe.dart';
import 'package:get/get.dart';

class NutritionGet extends GetConnect {
  final _api = "https://foodubeken.herokuapp.com/spoonacular/recipe";
  Future postApi(List<Data> data) async {
    Ingreepek ingreepek = Ingreepek(ingredients: data);
    final response = await post(_api, ingreepek.toJson());
    if (response.status.isOk) {
      // print(response.body);
      return response.body;
    }
    // print(response.statusText);
  }
}
