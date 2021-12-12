import 'package:flutter/material.dart';
import 'package:foodu/component/text.dart';
import 'package:foodu/constants/color.dart';
import 'package:foodu/constants/helpers.dart';
import 'package:foodu/controller/pages/explore.controller.dart';
import 'package:foodu/service/routes.dart';
import 'package:get/get.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return GetBuilder<ExploreController>(
        init: ExploreController(),
        builder: (controller) {
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                elevation: 0,
                title: CustomText(
                  text: 'Explore',
                  fontSize: 22,
                  color: Colors.black,
                ),
                centerTitle: true,
                backgroundColor: ColorConst.light,
                toolbarHeight: 70,
              ),
              SliverFillRemaining(
                child: ListView.builder(
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 50),
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              decoration: const BoxDecoration(
                                  color: ColorConst.profile,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30))),
                              child: const Center(
                                child: CustomText(
                                  text: 'What do you want to cook\ntoday ?',
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Container(
                              width: size.width,
                              height: 100,
                              color: ColorConst.profile,
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.decont, arguments: [
                                    controller.categori[
                                        controller.categories[index]][true],
                                    controller.categories[index]
                                  ]);
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: ColorConst.light,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: CustomText(
                                      text: controller.categories[index],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }
                      return Container(
                        width: size.width,
                        height: 100,
                        color: ColorConst.profile,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.decont, arguments: [
                              controller.categori[controller.categories[index]]
                                  [true],
                              controller.categories[index]
                            ]);
                            // Get.toNamed(Routes.decont, arguments: [
                            //   controller.categori[controller.categories[index]],
                            //   controller.categories[index],
                            // ]);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: ColorConst.light,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: CustomText(
                                text: controller.categories[index],
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
        });
  }
}
