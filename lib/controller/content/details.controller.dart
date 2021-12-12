import 'package:flutter/material.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/class/user.dart';
import 'package:foodu/service/backend.dart';
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
  Rx<GetRecipe>? argument;
  RxList<int>? containing;
  RxBool? favorited;

  init(GetRecipe value) {
    argument = value.obs;
    if (argument!.value.favorited
        .contains('d8c976b7-82d6-4ef3-bd8b-28789075684c')) {
      favorited = true.obs;
    } else {
      favorited = false.obs;
    }
  }

  onChange() async {
    var function;
    if (favorited!.value) {
      argument!.value.favorited.remove('d8c976b7-82d6-4ef3-bd8b-28789075684c');
    } else {
      argument!.value.favorited.add('d8c976b7-82d6-4ef3-bd8b-28789075684c');
    }
    function = await ApiHelper.updateFavorite(
        idrecipe: argument!.value.id, newfavorited: argument!.value.favorited);
    favorited!.value = !favorited!.value;
    print(function);
    if (function != null) {
      argument!.value = function;
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

  // void onchange() {
  //   if (favorited) {
  //     containing.remove(argument.id);
  //   } else {
  //     containing.add(argument.id);
  //   }
  //   favorited = !favorited;
  //   update();
  // }
}
