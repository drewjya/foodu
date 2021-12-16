import 'package:flutter/material.dart';
import 'package:foodu/components/newscaffold.dart';
import 'package:foodu/constant/color.dart';
import 'package:foodu/pages/wrapper/wrapper_controller.dart';
import 'package:get/get.dart';

class WrapperView extends StatelessWidget {
  const WrapperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WrapperController>(builder: (controller) {
      return const NewScaffold(
        backgroundColor: NewColor.original,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    });
  }
}
