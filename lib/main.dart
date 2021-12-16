import 'package:flutter/material.dart';
import 'package:foodu/config/config.dart';
import 'package:foodu/constant/color.dart';
import 'package:get/get.dart';
import 'config/pages.dart';
import 'config/routes.dart';
import 'package:supabase/supabase.dart';

void main() {
  Get.put<SupabaseClient>(SupabaseClient(supabaseUrl, supabaseAnnonKey));
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FoodU',
      theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
        cursorColor: NewColor.original,
      )),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.wrapper,
      getPages: pages,
    );
  }
}
