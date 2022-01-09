import 'package:flutter/material.dart';
import 'package:foodu/components/newscaffold.dart';
import 'package:foodu/constant/color.dart';
import 'package:foodu/pages/dashboard/dashboard_controller.dart';
import 'package:foodu/pages/dashboard/explore/explore_view.dart';
import 'package:foodu/pages/dashboard/home/home_view.dart';
import 'package:foodu/pages/dashboard/profile/profile_view.dart';
import 'package:foodu/pages/dashboard/upload/upload_view.dart';
import 'package:get/get.dart';

List<Widget> body = [
  const HomeView(),
  const ExploreView(),
  const UploadView(),
  const ProfileView(),
];

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (dashboard) {
      return NewScaffold(
        body: body[dashboard.selected.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: NewColor.background,
          selectedItemColor: NewColor.original,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) => dashboard.getItem(value),
          backgroundColor: NewColor.cream,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '',),
          ],
          currentIndex: dashboard.selected.value,
        ),
      );
    });
  }
}
