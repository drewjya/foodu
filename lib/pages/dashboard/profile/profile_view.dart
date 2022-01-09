import 'package:flutter/material.dart';
import 'package:foodu/components/newtext.dart';
import 'package:foodu/config/routes.dart';
import 'package:foodu/constant/color.dart';
import 'package:foodu/services/service.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = getSize(context);
    return GetBuilder<Service>(builder: (controller) {
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: false,
            backgroundColor: NewColor.profile,
            expandedHeight: 50,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () => Get.toNamed(Routes.logout),
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: 150,
                  color: NewColor.profile,
                ),
                Center(
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(
                              0,
                              0.5,
                            ),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.red,
                            foregroundImage: null,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          NewText(
                            controller.user.username,
                            fontSize: 18,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          NewText(
                            controller.user.bio,
                            fontSize: 15,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  NewText(
                                    controller.favorite.length.toString(),
                                  ),
                                  const NewText(
                                    'Favorites',
                                    fontSize: 15,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  NewText(
                                    controller.user.followers.toString(),
                                  ),
                                  const NewText(
                                    'Followers',
                                    fontSize: 15,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  NewText(
                                    controller.user.following.toString(),
                                  ),
                                  const NewText(
                                    'Following',
                                    fontSize: 15,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              height: 30,
              margin: const EdgeInsets.only(bottom: 10, left: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const NewText(
                    "Showcases",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.seeall, arguments: [
                          "Showcases",
                          controller.create,
                        ]);
                      },
                      child: const NewText(
                        "see all",
                        fontSize: 14,
                        color: NewColor.original,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              height: (controller.create.isEmpty) ? 50 : 200,
              child: (controller.create.isEmpty)
                  ? const Center(
                      child: NewText(
                        'Create your own creation!',
                        color: NewColor.original,
                        fontSize: 20,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.create.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.content,
                                arguments: controller.create[index]);
                          },
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
                                controller.create[index].imglink,
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
              height: 50,
              margin: const EdgeInsets.only(bottom: 10, left: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const NewText(
                    "Cookbook",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.seeall,
                            arguments: ["Cookbook", controller.favorite]);
                      },
                      child: const NewText(
                        "see all",
                        fontSize: 14,
                        color: NewColor.original,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 20, bottom: 20),
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.favorite.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.content,
                          arguments: controller.favorite[index]);
                    },
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
                          controller.favorite[index].imglink,
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
    });
  }
}
