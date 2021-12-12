import 'package:foodu/class/recipe.dart';
import 'package:foodu/class/user.dart';
import 'package:foodu/service/backend.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  UserData? mockuser;
  RxList<GetRecipe> favorited = <GetRecipe>[].obs;
  RxList<GetRecipe> created = <GetRecipe>[].obs;
  RxList<GetRecipe> resep = <GetRecipe>[].obs;
  void fetchData() async {
    var recipes = await ApiHelper.fetchRecipe();
    var user = await ApiHelper.fetchUser(
        userid: 'd8c976b7-82d6-4ef3-bd8b-28789075684c');
    if (recipes != null) {
      resep.addAll(recipes);
      if (user != null) {
        mockuser = user;
      }

      for (var item in resep) {
        if (item.creator == mockuser!.id) {
          created.add(item);
        }
        for (var element in item.favorited) {
          if (element == mockuser!.id) {
            favorited.add(item);
          }
        }
        favorited.sort(
            (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
      }
    }
  }

  @override
  onInit() {
    fetchData();
    super.onInit();
  }
}
