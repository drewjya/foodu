import 'package:flutter/material.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/components/newscaffold.dart';
import 'package:foodu/components/newtext.dart';
import 'package:foodu/config/routes.dart';
import 'package:foodu/constant/color.dart';
import 'package:foodu/services/service.dart';
import 'package:get/get.dart';

class DetailsCategories extends StatelessWidget {
  const DetailsCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> receive = Get.arguments;
    return GetBuilder<Service>(
      builder: (controller) {
        List<GetRecipe> current = [];
        if (receive[0] != null) {
          current.addAll(receive[0]);
        }
        return NewScaffold(
          appBar: AppBar(
            title: NewText(
              receive[1],
              fontSize: 19,
            ),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          body: (current.isEmpty)
              ? const Center(child: NewText("Kosong"))
              : Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: current.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.content,
                              arguments: current[index]);
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(current[index].imglink),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: NewColor.cream,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    )),
                                height: 34,
                                child: Center(
                                  child: FittedBox(
                                    child: NewText(
                                      current[index].title,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.values[4],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
