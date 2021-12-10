import 'package:foodu/class/recipe.dart';
import 'package:foodu/class/user.dart';
import 'package:get/get.dart';
import 'package:foodu/view/pages/resep.dart';

class ProfileController extends GetxController {
  User mockuser = User(
      username: 'Bambi',
      email: 'email',
      bio: 'haha',
      favorited: [10, 14, 11],
      followers: 0,
      following: 0,
      imglink: '',
      recipe: [10, 12, 13]);
  List<GetRecipe> favorited = [];
  List<GetRecipe> created = [];
  List<GetRecipe> resep = [];

  @override
  onInit() {
    for (var element in data) {
      resep.add(GetRecipe.fromJson(json: element));
    }
    for (var item in resep) {
      for (var element in mockuser.favorited) {
        if (element.isEqual(item.id)) {
          favorited.add(item);
        }
      }
      for (var element in mockuser.recipe) {
        if (element.isEqual(item.id)) {
          created.add(item);
        }
      }
    }
    super.onInit();
  }
}
