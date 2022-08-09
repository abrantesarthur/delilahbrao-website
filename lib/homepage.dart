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
  late double screenHeight;
  late double bottomPadding;

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
    screenHeight = MediaQuery.of(context).size.height;
    bottomPadding = 0.01 * screenHeight;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewPortConstraints) {
            if (viewPortConstraints.maxWidth > 700) {
              return desktopView();
            }
            return mobileView();
          },
        ),
      ),
    );
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTabBar(
          controller: tabController,
          tabs: contentViews.map((cv) => cv.tab).toList(),
        ),
        SizedBox(
          height: 0.85 * screenHeight, // make view responsive TODO: adjust
          child: TabBarView(
            controller: tabController,
            children: contentViews.map((cv) => cv.content).toList(),
          ),
        ),
      ],
    );
  }

  Widget mobileView() {
    return Column();
  }
}
