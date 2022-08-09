import 'package:delilahbrao/content_view.dart';
import 'package:delilahbrao/custom_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<ContentView> contentViews = [
    ContentView(
      tab: const CustomTab(title: 'Home'),
      content: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      ),
    ),
    ContentView(
      tab: const CustomTab(title: 'About'),
      content: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewPortConstraints) {
          if (viewPortConstraints.maxWidth > 700) {
            return desktopView();
          }
          return mobileView();
        },
      ),
    );
  }

  Widget desktopView() {
    return Column();
  }

  Widget mobileView() {
    return Column();
  }
}
