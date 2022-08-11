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

  // home, about, listen, follow, newsletter, contact

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottomPadding = 0.01 * screenHeight;
    return Scaffold(
      backgroundColor: Colors.black,
      // TODO: add custom bar here
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
      children: [Container()],
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
              iconSize: screenWidth * 0.05,
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  // TODO: edit drawer and its theme
  Widget drawer() {
    return Drawer(
        child: ListView(
      children: [
        Container(
          height: screenHeight * 0.1,
        )
      ],
      // TODO: add children buttons
    ));
  }
}
