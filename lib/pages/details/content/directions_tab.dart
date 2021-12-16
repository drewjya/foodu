import 'package:flutter/material.dart';
import 'package:foodu/components/newtext.dart';

class DirectionsTab extends StatelessWidget {
  final List<String> directions;
  const DirectionsTab({
    Key? key,
    required this.directions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      key: const PageStorageKey("ingredients"),
      itemCount: directions.length,
      itemBuilder: (context, index) {
        var data = directions[index];
        return ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const MyBullet(),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: NewText(
                  data,
                  fontSize: 15.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyBullet extends StatelessWidget {
  const MyBullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
