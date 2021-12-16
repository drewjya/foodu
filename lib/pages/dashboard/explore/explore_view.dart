import 'package:flutter/material.dart';
import 'package:foodu/components/newtext.dart';
import 'package:foodu/config/routes.dart';
import 'package:foodu/constant/color.dart';
import 'package:foodu/services/service.dart';
import 'package:get/get.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = getSize(context);
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          elevation: 0,
          title: NewText(
            "Explore",
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: NewColor.cream,
          toolbarHeight: 75,
        ),
        SliverFillRemaining(
          child: GetBuilder<Service>(builder: (controller) {
            return ListView.builder(
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        decoration: const BoxDecoration(
                            color: NewColor.profile,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30))),
                        child: const Center(
                          child: NewText(
                            'What do you want to cook\ntoday ?',
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width,
                        height: 100,
                        color: NewColor.profile,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.categories, arguments: [
                              controller.listCategories[
                                  controller.categories.elementAt(index)][true],
                              controller.categories.elementAt(index),
                            ]);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: NewColor.cream,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: NewText(
                                controller.categories.elementAt(index),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Container(
                  width: size.width,
                  height: 100,
                  color: NewColor.profile,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.categories, arguments: [
                        controller.listCategories[
                            controller.categories.elementAt(index)][true],
                        controller.categories.elementAt(index),
                      ]);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: NewColor.cream,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: NewText(
                          controller.categories.elementAt(index),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
