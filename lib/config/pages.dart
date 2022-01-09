import 'package:foodu/config/routes.dart';
import 'package:foodu/pages/details/content/content_controller.dart';
import 'package:foodu/pages/details/content/content_view.dart';
import 'package:foodu/pages/details/content/see_all.dart';
import 'package:foodu/pages/details/details_categories.dart';
import 'package:foodu/pages/dashboard/dashboard_controller.dart';
import 'package:foodu/pages/dashboard/dashboard_view.dart';
import 'package:foodu/pages/landing/landing_view.dart';
import 'package:foodu/pages/registration/login_view.dart';
import 'package:foodu/pages/registration/logout_view.dart';
import 'package:foodu/pages/registration/signup_view.dart';
import 'package:foodu/pages/wrapper/wrapper_controller.dart';
import 'package:foodu/pages/wrapper/wrapper_view.dart';
import 'package:foodu/services/auth_controller.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> pages = [
  GetPage(
    name: Routes.landing,
    page: () => const LandingView(),
  ),
  GetPage(
    name: Routes.wrapper,
    page: () => const WrapperView(),
    binding: WrapperBindings(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginView(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: Routes.signup,
    page: () => const SignupView(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: Routes.dashboard,
    page: () => const DashboardView(),
    binding: DashboardBinding(),
  ),
  GetPage(
    name: Routes.content,
    page: () => const ContentView(),
    binding: ContentBinding(),
  ),
  GetPage(
    name: Routes.categories,
    page: () => const DetailsCategories(),
  ),
  GetPage(
    name: Routes.seeall,
    page: () => const SeeAll(),
  ),
  GetPage(
    name: Routes.logout,
    page: () => const LogoutPage(),
    binding: AuthBinding(),
  ),
];
