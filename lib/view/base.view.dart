import 'package:flutter/material.dart';
import 'package:foodu/component/newscaffold.dart';
import 'package:foodu/constants/color.dart';
import 'package:foodu/controller/base.controller.dart';
import 'package:foodu/view/pages/explore.view.dart';
import 'package:foodu/view/pages/home.view.dart';
import 'package:foodu/view/pages/profile.view.dart';
import 'package:foodu/view/pages/upload.view.dart';
import 'package:get/get.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      ColorConst.light,
      ColorConst.light,
      ColorConst.light,
      ColorConst.profile,
    ];
    List<Widget> body = [
      const HomeView(),
      const ExploreView(),
      const UploadView(),
      const ProfileView(),
    ];
    return GetBuilder<BaseController>(builder: (controller) {
      return NewScaffold(
        color: color[controller.selectedIndex],
        body: body[controller.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: controller.selectedIndex.isEqual(3)
              ? ColorConst.profile
              : ColorConst.light,
          selectedItemColor: controller.selectedIndex.isEqual(3)
              ? ColorConst.light
              : ColorConst.original,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'helo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'sj',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'sj',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contactless_sharp),
              label: 'sj',
            ),
          ],
          currentIndex: controller.selectedIndex,
          onTap: (value) => controller.onChange(value),
        ),
      );
    });
  }
}
