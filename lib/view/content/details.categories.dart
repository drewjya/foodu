import 'package:flutter/material.dart';
import 'package:foodu/constants/helpers.dart';
import 'package:get/get.dart';

import 'package:foodu/component/newscaffold.dart';
import 'package:foodu/component/text.dart';
import 'package:foodu/constants/color.dart';
import 'package:foodu/controller/content/dcategories.controller.dart';
import 'package:foodu/service/routes.dart';

class DetailsCategories extends StatelessWidget {
  const DetailsCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> data = Get.arguments;
    return GetBuilder<DCategoriesController>(builder: (controller) {
      controller.intit(data[0]);
      return NewScaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'Explore ${data[1]}',
            fontSize: 22,
            color: Colors.black,
          ),
          elevation: 0,
          foregroundColor: Colors.black,
          centerTitle: true,
          backgroundColor: ColorConst.white,
        ),
        body: (controller.item.isEmpty)
            ? const Center(
                child: Text('Kosong'),
              )
            : Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.toNamed(Routes.details,
                          arguments: controller.item[index]),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      controller.item[index].imglink),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: ColorConst.light,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  )),
                              height: 30,
                              child: Center(
                                child: Text(
                                  controller.item[index].title,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.item.length,
                ),
              ),
      );
    });
  }
}
