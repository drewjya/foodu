import 'package:flutter/material.dart';

class NewScaffold extends StatelessWidget {
  final Color? color;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final BottomNavigationBar? bottomNavigationBar;
  final Drawer? drawer;
  final Color? backgroundColor;
  const NewScaffold({
    Key? key,
    this.color,
    this.appBar,
    this.backgroundColor,
    required this.body,
    this.bottomNavigationBar,
    this.drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
          child: Scaffold(
        appBar: appBar,
        body: body,
        backgroundColor: backgroundColor,
        bottomNavigationBar: bottomNavigationBar,
        drawer: drawer,
      )),
    );
  }
}
