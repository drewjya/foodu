import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/components/newtext.dart';
import 'package:foodu/config/routes.dart';
import 'package:foodu/constant/color.dart';
import 'package:foodu/services/service.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = getSize(context);
    return GetBuilder<Service>(
      builder: (controller) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: NewColor.cream,
              toolbarHeight: 75,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.75,
                    height: 50,
                    decoration: BoxDecoration(
                      color: NewColor.light,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: TypeAheadField<GetRecipe>(
                        hideSuggestionsOnKeyboardHide: false,
                        hideOnLoading: true,
                        suggestionsCallback: (pattern) =>
                            controller.getRecipeSugestions(pattern),
                        itemBuilder: (context, itemData) {
                          return ListTile(
                            title: NewText(
                              itemData.title,
                              fontSize: 16,
                            ),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          controller.searchController.text = "";
                          Get.toNamed(Routes.content, arguments: suggestion);
                        },
                        noItemsFoundBuilder: (context) => const SizedBox(
                          height: 50,
                          child: Center(
                            child: NewText(
                              "There's no Recipe Found",
                              fontSize: 18,
                            ),
                          ),
                        ),
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: controller.searchController,
                          style: GoogleFonts.lato(
                            height: 1.6,
                          ),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),
                              hintText: 'what do you wanna cook today?',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: const BorderSide(
                                  color: NewColor.cream,
                                  width: 3,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: const BorderSide(
                                  color: NewColor.cream,
                                  width: 3,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: const BorderSide(
                                  color: NewColor.cream,
                                  width: 3,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: NewColor.original,
                      radius: 20,
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: size.width,
                height: 60,
                margin: const EdgeInsets.only(bottom: 10, left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NewText(
                      "What's hot",
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.seeall,
                              arguments: ["What's hot", controller.resepAll]);
                        },
                        child: const NewText(
                          "see all",
                          color: NewColor.original,
                          fontSize: 16.5,
                          fontWeight: FontWeight.w400,
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
                padding: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categoriesExist.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 100,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.categories, arguments: [
                            controller.listCategories[controller
                                .categoriesExist.keys
                                .elementAt(index)][true],
                            controller.categoriesExist.keys.elementAt(index),
                          ]);
                        },
                        child: Card(
                          child: Center(
                            child: NewText(
                              controller.categoriesExist.keys.elementAt(index),
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          color: Colors.white,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: NewColor.profile,
                                width: 0.5,
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.resepAll.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.toNamed(Routes.content,
                          arguments: controller.resepAll[index]),
                      child: SizedBox(
                        height: 170,
                        width: 250,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          margin: const EdgeInsets.all(10),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            controller.resepAll[index].imglink,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: size.width,
                height: 60,
                margin: const EdgeInsets.only(bottom: 10, left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NewText(
                      "fresh from the oven",
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.seeall, arguments: [
                            "fresh from the oven",
                            controller.resepAll
                          ]);
                        },
                        child: const NewText(
                          "see all",
                          color: NewColor.original,
                          fontSize: 16.5,
                          fontWeight: FontWeight.w400,
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
                padding: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categoriesExist.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 100,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.categories, arguments: [
                            controller.listCategories[controller
                                .categoriesExist.keys
                                .elementAt(index)][true],
                            controller.categoriesExist.keys.elementAt(index),
                          ]);
                        },
                        child: Card(
                          child: Center(
                            child: NewText(
                              controller.categoriesExist.keys.elementAt(index),
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          color: Colors.white,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: NewColor.profile,
                                width: 0.5,
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.resepAll.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.toNamed(Routes.content,
                          arguments: controller.resepAll[
                              controller.resepAll.length - 1 - index]),
                      child: SizedBox(
                        height: 170,
                        width: 250,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          margin: const EdgeInsets.all(10),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            controller
                                .resepAll[
                                    controller.resepAll.length - 1 - index]
                                .imglink,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
