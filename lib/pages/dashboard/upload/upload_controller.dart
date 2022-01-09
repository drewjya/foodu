import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/class/user.dart';
import 'package:foodu/constant/color.dart';
import 'package:foodu/services/getnutritions.dart';
import 'package:foodu/services/recipe_services.dart';
import 'package:foodu/services/service.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class UploadController extends GetxController {
  final _service = Get.find<Service>();
  final _recipeService = RecipeService();
  final title = TextEditingController();
  final descriptions = TextEditingController();
  final servings = TextEditingController();
  final cookingTime = TextEditingController();
  final choosenIngredients = TextEditingController();
  final quantityIngredients = TextEditingController();
  //**Picture Related */
  late File picture;
  bool imageExist = false;
  late String filename;
  Future pickImage() async {
    FilePickerResult? image = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
      allowCompression: true,
    );
    if (image != null) {
      picture = File(
        image.files.first.path!,
      );
      filename = image.files.first.name;
      imageExist = true;
    }
    update();
  }

  //** Ingredients Related */
  bool confirmIngredients = false;
  List<String> unitList = [];
  List<Data> selectedIngredients = [];
  List<IngredientsList> ingredientList = [];
  IngredientsList? data;
  String unit = '';

  fetchIngredients() async {
    ingredientList = _service.allIngredients;
    update();
  }

  updateIngredient() {
    if (choosenIngredients.text.isEmpty) {
      Get.snackbar("Warning", "Ingredients Cannot be empty",
          backgroundColor: Colors.red);
    } else {
      confirmIngredients = !confirmIngredients;
      for (var item in ingredientList) {
        if (item.name == choosenIngredients.text) {
          data = item;
          break;
        }
      }
      if (data == null) {
        Get.snackbar("Warning", "Ingredients Cannot be empty",
            backgroundColor: Colors.red);
      } else {
        unit = data!.units[0];
        unitList = data!.units;
        update();
      }
    }
  }

  onSugestionIngredients(query) {
    choosenIngredients.text = query;
    update();
  }

  addSelectedIngredients() {
    if (data != null) {
      if (quantityIngredients.text.isEmpty) {
        Get.snackbar("Warning", "Quantity cannot be empty",
            backgroundColor: Colors.red);
      } else {
        Data? curr = Data(
            name: data!.name,
            quantity: int.parse(quantityIngredients.text),
            unit: unit);
        selectedIngredients.add(curr);
        choosenIngredients.clear();
        quantityIngredients.clear();
        data = null;
        curr = null;
        confirmIngredients = !confirmIngredients;
      }
      update();
    } else {
      Get.snackbar(
        "Warning",
        "Ingredients cannot be empty",
        backgroundColor: Colors.red,
      );
    }
  }

  List<String> getSugestions(String query) {
    List<String> mathces = [];
    mathces.addAll(ingredientList.map((e) => e.name).toList());
    mathces.retainWhere(
        (element) => element.toLowerCase().startsWith(query.toLowerCase()));
    return mathces.take(5).toList();
  }

  getUnit(value) {
    unit = value;
    update();
  }

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

  List<String> choosenCategories = [];
  void chooseCategories(index) {
    if (categories[index]['choosen']) {
      choosenCategories.remove(categories[index]['name']);
    } else {
      choosenCategories.add(categories[index]['name']);
    }
    categories[index]['choosen'] = !categories[index]['choosen'];
    update();
  }

  //**Directions related*/
  final List<TextEditingController> tutorial = [TextEditingController()];
  int numOfCategories = 1;
  void addTutorial() {
    numOfCategories++;
    tutorial.add(TextEditingController());
    update();
  }

  void removeTutorial(index) {
    numOfCategories--;
    tutorial.removeAt(index);
    update();
  }

  NutritionGet nutritionGet = NutritionGet();

  uploadData() async {
    if (title.text.isEmpty ||
        descriptions.text.isEmpty ||
        descriptions.text.isEmpty ||
        servings.text.isEmpty ||
        cookingTime.text.isEmpty ||
        imageExist == false ||
        choosenCategories.isEmpty ||
        ingredientList.isEmpty ||
        tutorial.isEmpty) {
      Get.snackbar(
        "Warning",
        "Please input all of the field",
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 1),
      );
    } else {
      List<String> dataTut = [];
      for (var item in tutorial) {
        dataTut.add(item.text);
      }
      UserData user = await _service.getCurrentUser();
      final response = await nutritionGet.postApi(selectedIngredients);
      CaloriesSource caloriesSource = CaloriesSource.fromJson(json: response);
      final imgupload =
          await _recipeService.uploadImageRecipe(filename, picture);
      Recipe resep = Recipe(
          title: title.text,
          info: descriptions.text,
          creator: user.id,
          imglink: imgupload,
          cookingtime: cookingTime.text,
          ingredients: selectedIngredients,
          tutorial: tutorial.map((e) => e.text).toList(),
          categories: choosenCategories,
          serving: servings.text,
          protein: caloriesSource.protein,
          calories: caloriesSource.calories,
          carbs: caloriesSource.carbs,
          fat: caloriesSource.fat,
          created: DateTime.now());
      await _recipeService.insertRecipe(resep);
      title.clear();
      descriptions.clear();
      imageExist = false;
      cookingTime.clear();
      choosenCategories.clear();

      for (var element in categories) {
        element['choosen'] = false;
      }
      update();
      selectedIngredients.clear();
      servings.clear();
      data = null;
      picture.delete();
      tutorial.clear();
      tutorial.add(TextEditingController());
      numOfCategories = tutorial.length;
      update();
      Get.snackbar('Congrats', '${title.text} is uploaded',
          backgroundColor: Colors.greenAccent);
      notUploading = true;
      // _service.update();
      // Get.reload<Service>(force: true);
      update();
    }
  }

  bool notUploading = true;
  onSubmit() {
    Get.defaultDialog(
      title: 'Confirm',
      middleText: 'Are you finished',
      onConfirm: () async {
        notUploading = false;
        update();
        Get.back();
        await uploadData();
      },
      onCancel: () {},
      buttonColor: NewColor.original,
      confirmTextColor: Colors.white,
      cancelTextColor: NewColor.original,
    );
  }

  @override
  void onInit() {
    fetchIngredients();
    super.onInit();
  }

  @override
  void onClose() {
    title.dispose();
    cookingTime.dispose();
    descriptions.dispose();
    servings.dispose();
    choosenIngredients.dispose();
    quantityIngredients.dispose();
    super.onClose();
  }
}
