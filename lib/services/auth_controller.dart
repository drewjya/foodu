import 'package:flutter/material.dart';
import 'package:foodu/config/routes.dart';
import 'package:foodu/services/auth_services.dart';
import 'package:foodu/services/service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final authService = AuthService();

  login() async {
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isEmail) {
      bool response = await authService.login(email, password);
      if (response == true) {
        Get.put(Service(), permanent: true);
        Get.toNamed(Routes.dashboard);
      } else {
        Get.snackbar(
          'Warning',
          'Credentials is not valid',
          backgroundColor: Colors.red,
        );
      }
    } else {
      Get.snackbar(
        'Warning',
        'Email is not valid',
        backgroundColor: Colors.red,
      );
    }
  }

  signup() async {
    String email = emailController.text;
    String password = passwordController.text;
    String confirm = confirmpasswordController.text;
    if (password.compareTo(confirm) == 0) {
      if (email.isEmail) {
        bool response = await authService.signup(email, password);
        if (response == true) {
          Get.snackbar(
            'Congratulations',
            'Please confirm your email',
            backgroundColor: Colors.greenAccent,
          );
          Get.offAndToNamed(Routes.login);
        } else {
          Get.snackbar(
            'Warning',
            'Credentials is not valid',
            backgroundColor: Colors.red,
          );
        }
      } else {
        Get.snackbar(
          'Warning',
          'Email is not valid',
          backgroundColor: Colors.red,
        );
      }
    } else {
      Get.snackbar(
        'Warning',
        'Password is not valid',
        backgroundColor: Colors.red,
      );
    }
  }

  logut() async {
    var condition = await authService.logout();
    if (condition == false) {
      Get.snackbar(
        'Warning',
        'Cannot Logout',
        backgroundColor: Colors.red,
      );
    } else {
      Get.offAndToNamed(Routes.landing);
    }
  }
}

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
