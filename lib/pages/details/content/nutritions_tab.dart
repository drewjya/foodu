import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodu/components/newtext.dart';
import 'package:foodu/constant/color.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        children: [
          calories.replaceAll('k', ' cal'),
          fat,
          protein,
          carbs,
        ]
            .map((e) => Card(
                  shape: const CircleBorder(),
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        (e == calories)
                            ? FontAwesomeIcons.bolt
                            : (e == fat)
                                ? FontAwesomeIcons.hamburger
                                : (e == protein)
                                    ? FontAwesomeIcons.fire
                                    : FontAwesomeIcons.appleAlt,
                        color: NewColor.original,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      NewText(
                        e,
                        fontSize: 20,
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );

    // Column(
    //   children: [
    //     NewText(fat),
    //     NewText(carbs),
    //     NewText(calories),
    //     NewText(protein),
    //   ],
    // );
  }
}
