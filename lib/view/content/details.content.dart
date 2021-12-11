import 'package:flutter/material.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/component/newscaffold.dart';
import 'package:foodu/component/text.dart';
import 'package:foodu/constants/color.dart';
import 'package:foodu/constants/helpers.dart';
import 'package:foodu/controller/content/details.controller.dart';
import 'package:foodu/view/content/data/directions/directions.dart';
import 'package:foodu/view/content/data/ingredients/ingredients.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsContent extends StatelessWidget {
  const DetailsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetRecipe data = Get.arguments;

    var size = getSize(context);
    return GetBuilder<DetailsController>(builder: (controller) {
      controller.init(data);
      return NewScaffold(
        color: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              foregroundColor: ColorConst.original,
              expandedHeight: 60,
              pinned: true,
              elevation: 1,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.file_upload_outlined))
              ],
            ),
            SliverToBoxAdapter(
              child: Stack(children: [
                Center(
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      data.imglink,
                      fit: BoxFit.cover,
                      width: 280,
                      height: 320,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 270, left: 240),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () => controller.onchange(),
                        icon: Icon(
                          controller.favorited
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          size: 30,
                          color: ColorConst.original,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 27,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'by ',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: data.creator,
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorConst.original,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 100,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Expanded(child: Icon(Icons.star, color: Colors.white)),
                        Expanded(
                            child: Text(
                          //TODO ganti dgn rating
                          '4.5',
                          style: TextStyle(color: Colors.white),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                            child: Icon(Icons.access_time,
                                color: ColorConst.original)),
                        Expanded(
                          child: CustomText(
                            text: data.cookingtime.split(' ')[0],
                            fontSize: 27,
                          ),
                        ),
                        Expanded(
                          child: CustomText(
                            text:
                                data.cookingtime.split(' ')[1].toCapitalized(),
                            fontSize: 16.5,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                            child: Icon(Icons.shopping_bag_rounded,
                                color: ColorConst.original)),
                        Expanded(
                            child: CustomText(
                          fontSize: 27,
                          text: data.ingredients.length.toString(),
                        )),
                        Expanded(
                          child: Text(
                            'Ingredients',
                            style: GoogleFonts.lato(
                              fontSize: 16.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                            child: Icon(Icons.whatshot,
                                color: ColorConst.original)),
                        Expanded(
                            child: CustomText(
                          text: data.calories.replaceAll('kal', ''),
                          fontSize: 27,
                        )),
                        const Expanded(
                          child: CustomText(
                            text: 'Calories',
                            fontSize: 16.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                TabBar(
                  tabs: controller.myTab,
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: controller.tabController,
                  labelColor: Colors.black,
                  indicatorColor: ColorConst.original,
                  unselectedLabelColor: Colors.black.withOpacity(0.3),
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  Ingredients(ingredients: data.ingredients),
                  Directions(directions: data.tutorial),
                  const Center(
                    child: Text('3'),
                  ),
                ],
                controller: controller.tabController,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  const StickyTabBarDelegate(this.tabBar);
  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
