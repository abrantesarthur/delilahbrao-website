import 'package:delilahbrao/content_view.dart';
import 'package:delilahbrao/custom_tab.dart';
import 'package:delilahbrao/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

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
  void initState() {
    super.initState();

    tabController = TabController(length: contentViews.length, vsync: this);
  }

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTabBar(controller: tabController, tabs: []),
        Container(),
      ],
    );
  }

  Widget mobileView() {
    return Column();
  }
}
