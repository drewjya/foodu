import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:foodu/component/text.dart';
import 'package:foodu/constants/color.dart';
import 'package:foodu/constants/helpers.dart';
import 'package:foodu/controller/pages/home.controller.dart';
import 'package:foodu/service/routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: ColorConst.light,
          toolbarHeight: 80,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.75,
                decoration: BoxDecoration(
                    color: ColorConst.cream,
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(),
                // TypeAheadField(
                //   textFieldConfiguration: TextFieldConfiguration(
                //     controller: controller.searchRecipe,
                //     style: const TextStyle(height: 1.5),
                //     cursorColor: ColorConst.original,
                //     decoration: InputDecoration(
                //       fillColor: Colors.white,
                //       contentPadding:
                //           const EdgeInsets.symmetric(horizontal: 10),
                //       hintText: 'What do you wanna to cook today',
                //       floatingLabelStyle: const TextStyle(
                //         color: ColorConst.original,
                //         fontSize: 20,
                //       ),
                //       focusColor: ColorConst.original,
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: const BorderSide(
                //           color: ColorConst.original,
                //           width: 2,
                //         ),
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //     ),
                //   ),
                //   suggestionsCallback: (pattern) {
                //     return controller.getSugestions(pattern);
                //   },
                //   itemBuilder: (context, String itemData) {
                //     return ListTile(
                //       title: (itemData.isEmpty)
                //           ? const CustomText(
                //               text: 'Loading',
                //               fontSize: 15,
                //             )
                //           : CustomText(
                //               text: itemData,
                //               fontSize: 18,
                //             ),
                //     );
                //   },
                //   onSuggestionSelected: (suggestion) =>
                //       controller.onSugestion(suggestion),
                // ),
              ),
              InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundColor: ColorConst.original,
                  radius: 25,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: size.width,
            height: 80,
            margin: const EdgeInsets.only(bottom: 10, left: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "what's hot",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      // print(controller.newCateg);
                      // Get.toNamed(Routes.seeall, arguments: [
                      //   controller.exist.keys.toList(),
                      //   "what's hot",
                      //   controller.newCateg,
                      //   controller.allRecipe,
                      // ]);
                    },
                    child: Text(
                      "see all",
                      style: GoogleFonts.lato(
                        color: ColorConst.original,
                        fontSize: 16.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 40,
            margin: const EdgeInsets.only(left: 20),
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    homeController.exist.length, //controller.exist.length,
                itemBuilder: (context, index) {
                  // var current = controller.exist.keys.elementAt(index);
                  return SizedBox(
                    width: 100.0,
                    child: InkWell(
                      onTap: () {
                        // Get.toNamed(Routes.decont,
                        //     arguments: [controller.newCateg[current], current]);
                      },
                      child: Card(
                        child: Center(
                          child: CustomText(
                            text: homeController.exist.keys.elementAt(
                                index), //controller.exist.keys.elementAt(index),
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        color: ColorConst.white,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: ColorConst.profile, width: 0.5)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            height: 200,
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: homeController
                    .recipeList.length, //controller.listRecipe.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Get.toNamed(
                      //   Routes.details,
                      //   arguments: controller.listRecipe[index],
                      // );
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5,
                              spreadRadius: 1,
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  homeController.recipeList[index].imglink),
                              fit: BoxFit.cover)),
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: size.width,
            height: 40,
            margin: const EdgeInsets.only(bottom: 10, left: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "fresh from the oven",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "see all",
                      style: GoogleFonts.lato(
                        color: ColorConst.original,
                        fontSize: 16.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            height: 40,
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeController.exist.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 100.0,
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                        child: Center(
                          child:
                              Text(homeController.exist.keys.elementAt(index)),
                        ),
                        color: ColorConst.white,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: ColorConst.profile,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(left: 20, bottom: 20),
            height: 275,
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: homeController.recipeList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRoutes.details);
                      // Get.toNamed(Routes.details, arguments: resep[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      // height: 270,
                      width: 225,
                      height: 150,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.all(10),
                        child: Image.network(
                          homeController.recipeList[index].imglink,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
