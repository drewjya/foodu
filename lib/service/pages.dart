import 'package:foodu/bindings/base.bindings.dart';
import 'package:foodu/bindings/decont.bindings.dart';
import 'package:foodu/bindings/details.bindings.dart';
import 'package:foodu/bindings/login.bindings.dart';
import 'package:foodu/bindings/seeall.bindings.dart';
import 'package:foodu/bindings/signup.bindings.dart';
import 'package:foodu/service/routes.dart';
import 'package:foodu/view/base.view.dart';
import 'package:foodu/view/content/details.categories.dart';
import 'package:foodu/view/content/details.content.dart';
import 'package:foodu/view/landing.view.dart';
import 'package:foodu/view/login.view.dart';
import 'package:foodu/view/pages/seeall.dart';
import 'package:foodu/view/signup.view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> pages = [
  GetPage(
    name: Routes.landing,
    page: () => const LandingView(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginView(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: Routes.signup,
    page: () => const SignupView(),
    binding: SignupBinding(),
  ),
  GetPage(
    name: Routes.base,
    page: () => const BaseView(),
    binding: BaseBinding(),
    // binding: SignupBinding(),
  ),
  GetPage(
      name: Routes.details,
      page: () => const DetailsContent(),
      binding: DetailsBinding()),
  GetPage(
    name: Routes.decont,
    page: () => const DetailsCategories(),
    binding: DecontBindings(),
  ),
  GetPage(
    name: Routes.seeall,
    page: () => const SeeAll(),
    binding: SeeAllBindings(),
  ),
];
