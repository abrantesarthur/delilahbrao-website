import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required this.controller,
    required this.tabs,
  }) : super(key: key);

  final TabController controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // make tab bar's width responsive
    double scaling = screenWidth > 1400
        ? 0.5
        : screenWidth > 1200
            ? 0.6
            : screenWidth > 1000
                ? 0.7
                : screenWidth > 860
                    ? 0.8
                    : 1;

    return Theme(
      data: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        primarySwatch: Colors.red,
      ),
      child: SizedBox(
        width: screenWidth * scaling,
        child: TabBar(
          controller: controller,
          tabs: tabs,
        ),
      ),
    );
  }
}
