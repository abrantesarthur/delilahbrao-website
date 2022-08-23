import 'package:delilahbrao/const/footer_icons.dart';
import 'package:delilahbrao/const/nav_action.dart';
import 'package:delilahbrao/style.dart';
import 'package:delilahbrao/widgets/drawer.dart';
import 'package:delilahbrao/widgets/footer.dart';
import 'package:delilahbrao/widgets/navigation_bar/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String routeName = "/";

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  late double screenHeight;
  late double screenWidth;
  late double bottomPadding;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottomPadding = 0.01 * screenHeight;
    return Scaffold(
      endDrawer: CustomDrawer(),
      key: scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background-desktop.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (
            BuildContext context,
            BoxConstraints viewPortConstraints,
          ) {
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
    return SizedBox(
      // the container is a canvas covering the entire screen
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        children: const [
          Positioned(bottom: 20, child: Footer()),
          Positioned(
            top: 80,
            child: CustomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget mobileView() {
    return SizedBox(
      width: screenWidth,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.menu_rounded),
              iconSize: screenWidth < 400 ? 25 : 30,
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              color: Colors.white,
            ),
          ),
          const Positioned(
            bottom: 20,
            child: Footer(),
          ),
        ],
      ),
    );
  }
}
