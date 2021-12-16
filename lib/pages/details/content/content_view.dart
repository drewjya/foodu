import 'package:flutter/material.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/components/newscaffold.dart';
import 'package:foodu/components/newtext.dart';
import 'package:foodu/constant/color.dart';
import 'package:foodu/pages/details/content/content_controller.dart';
import 'package:foodu/pages/details/content/directions_tab.dart';
import 'package:foodu/pages/details/content/ingredients_tab.dart';
import 'package:foodu/pages/details/content/nutritions_tab.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentView extends StatelessWidget {
  const ContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = getSize(context);
    GetRecipe resep = Get.arguments;
    // final profile = Get.find<Service>();
    return NewScaffold(
      color: Colors.white,
      body: GetBuilder<ContentController>(
          init: ContentController(),
          builder: (controller) {
            controller.recipeCreator(resep);
            controller.isFavoriteTrue(resep);
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  foregroundColor: NewColor.original,
                  title: const NewText('Details'),
                  centerTitle: true,
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
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            clipBehavior: Clip.antiAlias,
                            child: AspectRatio(
                              aspectRatio: 12 / 9,
                              child: Image.network(
                                resep.imglink,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          // color: Colors.red,
                          width: size.width * 0.76,
                          child: AspectRatio(
                            aspectRatio: 11.8 / 11.8,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 50,
                                height: 50,
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
                                child: InkWell(
                                  onTap: () => controller.updateFavorite(resep),
                                  child: Center(
                                    child: Icon(
                                      (controller.isFavorite)
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: NewColor.original,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: NewText(
                          resep.title,
                          textAlign: TextAlign.center,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const NewText(
                            'by ',
                            fontSize: 19,
                          ),
                          NewText(
                            controller.creator,
                            fontSize: 19,
                            decoration: TextDecoration.underline,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: NewColor.original,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 80,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Expanded(
                              child: Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            Expanded(
                              child: NewText(
                                '4.5',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 150,
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
                                  child: Icon(
                                    Icons.access_time,
                                    color: NewColor.original,
                                  ),
                                ),
                                Expanded(
                                  child: NewText(
                                    resep.cookingtime.split(' ')[0],
                                    fontSize: 27,
                                  ),
                                ),
                                const Expanded(
                                  child: NewText(
                                    'Minutes',
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
                                  child: Icon(
                                    Icons.shopping_bag_rounded,
                                    color: NewColor.original,
                                  ),
                                ),
                                Expanded(
                                  child: NewText(
                                    '${resep.ingredients.length}',
                                    fontSize: 27,
                                  ),
                                ),
                                const Expanded(
                                  child: NewText(
                                    'Ingredients',
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
                                  child: Icon(
                                    Icons.access_time,
                                    color: NewColor.original,
                                  ),
                                ),
                                Expanded(
                                  child: NewText(
                                    resep.calories.replaceAll('kal', ''),
                                    fontSize: 27,
                                  ),
                                ),
                                const Expanded(
                                  child: NewText(
                                    'Calories',
                                    fontSize: 16.5,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
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
                      indicatorColor: NewColor.original,
                      unselectedLabelColor: Colors.black.withOpacity(0.4),
                      labelStyle: GoogleFonts.lato(
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
                  // hasScrollBody: false,
                  child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        IngredientsTab(ingredients: resep.ingredients),
                        DirectionsTab(
                            directions: resep.tutorial
                                .map((e) => e as String)
                                .toList()),
                        NutritionsTab(
                          calories: resep.calories,
                          carbs: resep.carbs,
                          fat: resep.fat,
                          protein: resep.protein,
                        ),
                      ]),
                )
              ],
            );
          }),
    );
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
