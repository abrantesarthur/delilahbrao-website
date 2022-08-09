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
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  late double screenHeight;
  late double screenWidth;
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
    ),
    ContentView(
      tab: const CustomTab(title: 'Listen'),
      content: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      ),
    ),
    ContentView(
      tab: const CustomTab(title: 'Follow'),
      content: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      ),
    ),
    ContentView(
      tab: const CustomTab(title: 'Newsletter'),
      content: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      ),
    ),
    ContentView(
      tab: const CustomTab(title: 'Contact'),
      content: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: contentViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottomPadding = 0.01 * screenHeight;
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: drawer(),
      key: scaffoldKey,
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
    return SizedBox(
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget drawer() {
    return Drawer(
        child: ListView(
            children: contentViews
                .map(
                  (e) => Container(
                    child: ListTile(
                      title: Text(e.tab.title),
                      onTap: () {},
                    ),
                  ),
                )
                .toList()));
  }
}
