import 'package:delilahbrao/home_tab.dart';
import 'package:delilahbrao/widgets/content_view.dart';
import 'package:delilahbrao/widgets/custom_tab.dart';
import 'package:delilahbrao/widgets/custom_tab_bar.dart';
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
    const ContentView(
      tab: CustomTab(title: 'Home'),
      content: HomeTab(),
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
    double scaling = screenHeight > 800
        ? 1
        : screenHeight > 550
            ? 0.9
            : screenHeight > 400
                ? 0.87
                : screenHeight > 330
                    ? 0.84
                    : 0.8;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomTabBar(
          controller: tabController,
          tabs: contentViews.map((cv) => cv.tab).toList(),
        ),
        SizedBox(
          height: scaling * screenHeight,
          child: TabBarView(
            controller: tabController,
            children: contentViews.map((cv) => cv.content).toList(),
          ),
        ),
      ],
    );
  }

  Widget mobileView() {
    return Padding(
      padding: EdgeInsets.only(
        top: screenWidth * 0.05,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
      ),
      child: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.menu_rounded),
              iconSize: screenWidth * 0.08,
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  // TODO: edit drawer theme like we did for the CustomTabBar
  Widget drawer() {
    return Drawer(
        child: ListView(
            children: [
                  Container(
                    height: screenHeight * 0.1,
                  )
                ] +
                contentViews
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
