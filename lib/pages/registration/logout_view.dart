import 'package:foodu/components/newscaffold.dart';
import 'package:foodu/components/newtext.dart';
import 'package:foodu/services/auth_controller.dart';
import 'package:foodu/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (auth) {
      return NewScaffold(
        body: Center(
            child: InkWell(
          onTap: () => auth.logut(),
          child: const NewText('Log Out'),
        )),
      );
    });
  }
}
