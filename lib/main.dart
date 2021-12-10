import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodu/service/pages.dart';
import 'package:foodu/service/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FoodU',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.base,
      getPages: pages,
    );
  }
}
