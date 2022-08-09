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
    double scaling = screenWidth > 1400
        ? 0.21
        : screenWidth > 1100
            ? 0.3
            : 0.4;
    return SizedBox(
      width: screenWidth * scaling,
      child: TabBar(
        controller: controller,
        tabs: tabs,
      ),
    );
  }
}
