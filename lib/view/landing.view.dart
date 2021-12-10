import 'package:flutter/material.dart';
import 'package:foodu/constants/color.dart';
import 'package:foodu/constants/helpers.dart';
import 'package:foodu/component/text.dart';
import 'package:foodu/service/routes.dart';
import 'package:get/get.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = getSize(context);
    return Container(
      color: ColorConst.white,
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.075,
                  ),
                  const Center(
                    child: CustomText(
                      text: 'Welcome to Foodu',
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.075,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.signup);
                    },
                    child: Container(
                      width: size.width * 0.8,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorConst.light,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: CustomText(
                          text: 'sign up',
                          fontSize: 17.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.login);
                    },
                    child: const CustomText(
                      text: 'have an account? sign in',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorConst.original,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
