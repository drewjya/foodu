import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/constants/color.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController servings = TextEditingController();
  final TextEditingController cookingtime = TextEditingController();
  //**Picture Related */
  late File picture;
  bool imageExist = false;
  ImagePicker picker = ImagePicker();
  Future pickImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      picture = File(image.path);
      imageExist = true;
    }
    update();
  }

  //**Ingredients Related */
  final TextEditingController chooseIngredients = TextEditingController();
  final TextEditingController qtyitem = TextEditingController();
  bool confirmIngredient = false;
  List<String> listunit = [];
  List<Data> selectedIngredients = [];
  List<IngredientsList> ingredientList = [
    IngredientsList(id: 1, name: 'es th', imglink: '', units: ['kg', 'g']),
    IngredientsList(id: 2, name: 'gula', imglink: '', units: ['can', 'scoop']),
    IngredientsList(
        id: 3, name: 'kemenyan teh', imglink: '', units: ['kg', 'g']),
    IngredientsList(id: 4, name: 'garam th', imglink: '', units: ['kg', 'g']),
  ];
  String unit = '';
  IngredientsList? data;
  updateIngredient() {
    confirmIngredient = !confirmIngredient;
    for (var item in ingredientList) {
      if (item.name == chooseIngredients.text) {
        data = item;
        break;
      }
    }
    if (data == null) {
      Get.snackbar('Ingredients', 'Cannot be empty',
          backgroundColor: Colors.red);
    } else {
      unit = data!.units[0];
      listunit = data!.units;
      update();
    }
  }

  onSugestionIngredients(query) {
    chooseIngredients.text = query;
    update();
  }

  addSelectedIngredients() {
    if (data != null) {
      Data? curr =
          Data(name: data!.name, quantity: int.parse(qtyitem.text), unit: unit);
      selectedIngredients.add(curr);
      chooseIngredients.clear();
      data = null;
      curr = null;
      confirmIngredient = !confirmIngredient;
    }
    update();
  }

  List<String> getSugestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(ingredientList.map((e) => e.name).toList());
    matches.retainWhere(
        (element) => element.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  getunit(value) {
    unit = value;
    update();
  }

//**Categories Related */
  List<Map<String, dynamic>> categories = [
    {
      'name': 'Breakfast',
      'choosen': false,
    },
    {
      'name': 'Snack',
      'choosen': false,
    },
    {
      'name': 'Dinner',
      'choosen': false,
    },
    {
      'name': 'Halal',
      'choosen': false,
    },
    {
      'name': 'Kosher',
      'choosen': false,
    },
    {
      'name': 'Vegetarian',
      'choosen': false,
    },
    {
      'name': 'Seafood',
      'choosen': false,
    },
    {
      'name': 'Low Fat',
      'choosen': false,
    },
    {
      'name': 'Dairy Free',
      'choosen': false,
    },
  ];
  void chooseCategories(index) {
    categories[index]['choosen'] = !categories[index]['choosen'];
    update();
  }

//**Tutorial Related */
  final List<TextEditingController> tutorial = [TextEditingController()];
  int numoftextfield = 1;
  void addTutorial() {
    numoftextfield++;
    tutorial.add(TextEditingController());
    update();
  }

  void removeTutorial(index) {
    numoftextfield--;
    tutorial.removeAt(index);
    update();
  }

  @override
  void onClose() {
    title.dispose();
    cookingtime.dispose();
    description.dispose();
    servings.dispose();
    chooseIngredients.dispose();
    qtyitem.dispose();

    super.onClose();
  }

  onSubmit() {
    Get.defaultDialog(
      title: 'Confirm',
      middleText: 'Are you finished',
      onConfirm: () {},
      onCancel: () {},
      buttonColor: ColorConst.original,
      confirmTextColor: ColorConst.white,
      cancelTextColor: ColorConst.original,
    );
  }
}
