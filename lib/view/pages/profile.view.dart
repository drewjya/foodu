import 'package:flutter/material.dart';
import 'package:foodu/component/text.dart';
import 'package:foodu/constants/color.dart';
import 'package:foodu/controller/pages/profile.controller.dart';
import 'package:foodu/service/routes.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Get.put(ProfileController());
    return Obx(
      () => CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: false,
            backgroundColor: const Color.fromRGBO(255, 139, 51, 0.74),
            expandedHeight: size.height * 0.05,
            foregroundColor: Colors.white,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            ],
            // leading: Icon(Icons.arrow_back),
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height * 0.15,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 139, 51, 0.74)),
                    ),
                    SizedBox(
                      height: size.height * 0.17,
                    ),
                  ],
                ),
                Positioned(
                  left: size.width * 0.15,
                  top: size.width * 0.05,
                  child: Container(
                    width: size.width * 0.7,
                    height: size.width * 0.55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(
                              0, 0.5), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.23,
                            ),
                            const Expanded(
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 40,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_rounded,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: CustomText(
                              text: controller.mockuser!.username,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: CustomText(
                              text: controller.mockuser!.bio, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CustomText(
                                    text:
                                        controller.favorited.length.toString(),
                                    fontSize: 16),
                                const CustomText(
                                  text: 'Favorites',
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CustomText(
                                    text: controller.mockuser!.followers
                                        .toString(),
                                    fontSize: 16),
                                const CustomText(
                                  text: 'Followers',
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CustomText(
                                    text: controller.mockuser!.following
                                        .toString(),
                                    fontSize: 16),
                                const CustomText(
                                  text: 'Following',
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              height: size.height * 0.08,
              margin: const EdgeInsets.only(bottom: 10, left: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Showcases",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: InkWell(
                      onTap: () {},
                      child: const CustomText(
                        text: "see all",
                        fontSize: 14,
                        color: ColorConst.original,
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
              height: 275,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.created.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRoutes.details);
                      Get.toNamed(Routes.details,
                          arguments: controller.created[index]);
                    },
                    child: SizedBox(
                      height: 200,
                      width: 304,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.all(20),
                        child: Image.network(
                          controller.created[index].imglink,
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
              height: 20,
              margin: const EdgeInsets.only(bottom: 10, left: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Cookbook",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: InkWell(
                      onTap: () {},
                      child: const CustomText(
                        text: "see all",
                        fontSize: 14,
                        color: ColorConst.original,
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
              height: 275,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.favorited.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRoutes.details);
                      Get.toNamed(Routes.details,
                          arguments: controller.favorited[index]);
                    },
                    child: SizedBox(
                      height: 200,
                      width: 304,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.all(20),
                        child: Image.network(
                          controller.favorited[index].imglink,
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
      ),
    );
  }
}
