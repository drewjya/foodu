import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final signupFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool loading = true;
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.onClose();
  }

  void display() {
    loading = !loading;
    update();
  }

  String? validator(String value) {
    if (value.isEmpty) {
      return 'This field must be filled';
    }
    return null;
  }

  void signup() {
    if (signupFormKey.currentState!.validate()) {
      checkUser(emailController.text, passwordController.text).then((auth) {
        if (auth) {
          Get.showSnackbar(const GetSnackBar(
            title: 'signup',
            message: 'Congrats',
          ));
        } else {
          Get.showSnackbar(const GetSnackBar(
            title: 'signup',
            message: 'Invalid email or password',
          ));
        }
        passwordController.clear();
      });
    }
  }

  Future<bool> checkUser(String user, String password) {
    if (user == 'foo@foo.com' && password == '123') {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
