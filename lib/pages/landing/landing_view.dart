import 'package:flutter/material.dart';
import 'package:foodu/components/newtext.dart';
import 'package:foodu/config/routes.dart';
import 'package:foodu/constant/color.dart';
import 'package:get/get.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = getSize(context);

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              width: size.width,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            const Center(
              child: NewText(
                'Welcome to Foodu',
                fontSize: 23,
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Container(
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(
                color: NewColor.cream,
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () => Get.toNamed(Routes.signup),
                child: const Center(
                  child: NewText(
                    'sign up',
                    fontSize: 17.5,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.login),
              child: const NewText(
                'have an account? sign in',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: NewColor.original,
                decoration: TextDecoration.underline,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
