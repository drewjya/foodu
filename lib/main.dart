import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodu/service/config.dart';
import 'package:foodu/service/pages.dart';
import 'package:foodu/service/routes.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.base,
      getPages: pages,
    );
  }
}
