import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodu/components/newscaffold.dart';
import 'package:foodu/components/newtext.dart';
import 'package:foodu/constant/color.dart';
import 'package:foodu/services/auth_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = getSize(context);
    return GetBuilder<AuthController>(builder: (auth) {
      return NewScaffold(
        color: Colors.white,
        body: Stack(
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: SizedBox(
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
                      child: const Center(
                        child: NewText(
                          'sign up',
                          fontSize: 17.5,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const NewText(
                      'have an account? sign in',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: NewColor.original,
                      decoration: TextDecoration.underline,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 2,
                sigmaX: 2,
              ),
              child: Center(
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: 300,
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Center(child: NewText('Sign Up', fontSize: 21)),
                        Container(
                          width: 380 * 0.7,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: const Color(0XFFFF6E00), width: 1.2),
                          ),
                          child: TextField(
                            controller: auth.emailController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, bottom: 5, right: 10),
                              border: InputBorder.none,
                              hintStyle:
                                  GoogleFonts.lato(color: NewColor.original),
                              labelStyle:
                                  GoogleFonts.lato(color: NewColor.original),
                              hintText: 'Email',
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Container(
                          width: 380 * 0.7,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: const Color(0XFFFF6E00), width: 1.2),
                          ),
                          child: TextField(
                            controller: auth.passwordController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, bottom: 5, right: 10),
                              border: InputBorder.none,
                              hintStyle:
                                  GoogleFonts.lato(color: NewColor.original),
                              labelStyle:
                                  GoogleFonts.lato(color: NewColor.original),
                              hintText: 'Password',
                              labelText: 'Password',
                            ),
                            obscureText: true,
                          ),
                        ),
                        Container(
                          width: 380 * 0.7,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: const Color(0XFFFF6E00), width: 1.2),
                          ),
                          child: TextField(
                            controller: auth.confirmpasswordController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10, bottom: 5, right: 10),
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.lato(
                                color: NewColor.original,
                              ),
                              labelStyle: GoogleFonts.lato(
                                color: NewColor.original,
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
                            Wrap(
                              children: const [
                                NewText(
                                  'I’ve read and accept the terms and conditions',
                                  fontSize: 12,
                                  color: NewColor.original,
                                ),
                              ],
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () => auth.signup(),
                          child: Container(
                            width: size.width * 0.8,
                            height: 50,
                            decoration: BoxDecoration(
                              color: NewColor.cream,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: NewText(
                                'sign me up',
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
          ],
        ),
      );
    });
  }
}
