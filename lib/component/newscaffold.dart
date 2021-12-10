import 'package:flutter/material.dart';

class NewScaffold extends StatelessWidget {
  final Color? color;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final BottomNavigationBar? bottomNavigationBar;
  final Widget? drawer;
  final FloatingActionButton? floatingActionButton;
  const NewScaffold({
    Key? key,
    this.color,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.drawer,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: Scaffold(
          appBar: appBar,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          drawer: drawer,
          floatingActionButton: floatingActionButton,
        ),
      ),
    );
  }
}
