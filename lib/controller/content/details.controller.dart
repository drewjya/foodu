import 'package:flutter/material.dart';
import 'package:foodu/class/recipe.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
      
  final List<Tab> myTab = <Tab>[
    Tab(
      text: 'Ingredients'.toUpperCase(),
    ),
    Tab(
      text: 'Directions'.toUpperCase(),
    ),
    Tab(
      text: 'Nutritions'.toUpperCase(),
    ),
  ];

  late TabController tabController;
  late GetRecipe argument;
  late bool favorited;
  var contain = [11, 12, 13, 14, 15];
  init(value) {
    argument = value;
    if (contain.contains(argument.id)) {
      favorited = true;
    } else {
      favorited = false;
    }
  }

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 3);
    super.onInit();
  }

  @override
  onClose() {
    tabController.dispose();
  }

  void onchange() {
    if (favorited) {
      contain.remove(argument.id);
    } else {
      contain.add(argument.id);
    }
    favorited = !favorited;
    update();
  }
}
