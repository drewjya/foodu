import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodu/component/newscaffold.dart';
import 'package:foodu/component/text.dart';
import 'package:foodu/constants/color.dart';
import 'package:foodu/constants/helpers.dart';
import 'package:foodu/controller/signup.controller.dart';
import 'package:foodu/service/routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = getSize(context);
    return GetBuilder<SignupController>(builder: (controller) {
      return NewScaffold(
        color: Colors.white,
        body: Stack(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: SizedBox(
                width: size.width,
                height: size.height,
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
                      Container(
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
                      const CustomText(
                        text: 'have an account? sign in',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ColorConst.original,
                        decoration: TextDecoration.underline,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Center(
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Form(
                    // key: controller.signupFormKey,
                    child: Container(
                      width: size.width * 0.8,
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                          color: ColorConst.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Center(
                              child: CustomText(text: 'Sign Up', fontSize: 21)),
                          Container(
                            width: size.width * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: const Color(0XFFFF6E00), width: 1.2),
                            ),
                            child: TextFormField(
                              // controller: passwordController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, bottom: 5, right: 10),
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.lato(
                                    color: ColorConst.original),
                                labelStyle: GoogleFonts.lato(
                                    color: ColorConst.original),
                                hintText: 'Email',
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: const Color(0XFFFF6E00), width: 1.2),
                            ),
                            child: TextFormField(
                              // controller: passwordController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, bottom: 5, right: 10),
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.lato(
                                    color: ColorConst.original),
                                labelStyle: GoogleFonts.lato(
                                    color: ColorConst.original),
                                hintText: 'Password',
                                labelText: 'Password',
                              ),
                              obscureText: true,
                            ),
                          ),
                          Container(
                            width: size.width * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: const Color(0XFFFF6E00), width: 1.2),
                            ),
                            child: TextFormField(
                              // controller: passwordController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, bottom: 5, right: 10),
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.lato(
                                  color: ColorConst.original,
                                ),
                                labelStyle: GoogleFonts.lato(
                                  color: ColorConst.original,
                                ),
                                hintText: 'Confirm Password',
                                labelText: 'Confirm Password',
                              ),
                              obscureText: true,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const CustomText(
                                text:
                                    'I’ve read and accept the terms and conditions',
                                fontSize: 12,
                                color: ColorConst.original,
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offAllNamed(Routes.base,
                                  predicate: (Route<dynamic> route) => false);
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
                                  text: 'sign me up',
                                  fontSize: 17.5,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
