import 'package:get/get.dart';

class SeeAllCont extends GetxController {
  List<String> categories = [];
  init(List<String> data) {
    categories.addAll(data);
  }
}
