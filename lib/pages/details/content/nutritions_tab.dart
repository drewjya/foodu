import 'package:flutter/material.dart';
import 'package:foodu/components/newtext.dart';

class NutritionsTab extends StatelessWidget {
  final String calories;
  final String carbs;
  final String fat;
  final String protein;
  const NutritionsTab({
    Key? key,
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.protein,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewText(fat),
        NewText(carbs),
        NewText(calories),
        NewText(protein),
      ],
    );
    // return GridView(

    //   children: [
    //     Container(
    //       height: 50,
    //       width: 50,
    //       decoration: BoxDecoration(
    //         color: Colors.red,
    //         borderRadius: BorderRadius.circular(50),
    //       ),
    //     ),
    //   ],
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     childAspectRatio: 10,
    //     mainAxisExtent: 3,
    //     crossAxisSpacing: 3,
    //   ),
    // );
  }
}
