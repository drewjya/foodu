import 'package:flutter/material.dart';
import 'package:foodu/class/recipe.dart';
import 'package:foodu/constants/helpers.dart';

class Ingredients extends StatelessWidget {
  final List<Data> ingredients;
  const Ingredients({Key? key, required this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey("ingredients"),
      itemCount: ingredients.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var data = ingredients[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
              title: Text('${data.quantity} ${data.unit} '),
              subtitle: Text(
                data.name.toCapitalized(),
              )),
        );
      },
    );
  }
}
