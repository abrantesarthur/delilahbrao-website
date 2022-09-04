import 'package:delilahbrao/widgets/drawer.dart';
import 'package:delilahbrao/widgets/footer.dart';
import 'package:delilahbrao/widgets/navigation_bar/index.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Template extends StatefulWidget {
  Template({
    Key? key,
    this.desktopView,
    this.mobileView,
    this.darkBackground = false,
  }) : super(key: key);

  final Widget? desktopView;
  final Widget? mobileView;
  bool darkBackground;

  @override
  TemplateState createState() => TemplateState();
}

class TemplateState extends State<Template>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late double screenHeight;
  late double screenWidth;
  late double bottomPadding;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottomPadding = 0.01 * screenHeight;

    return Scaffold(
      endDrawer: const CustomDrawer(),
      key: scaffoldKey,
      body: LayoutBuilder(
        builder: (
          BuildContext context,
          BoxConstraints viewPortConstraints,
        ) {
          final showMobile = viewPortConstraints.maxWidth < 700;
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "images/background-" +
                      (showMobile ? "mobile" : "desktop") +
                      ".jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color:
                  Colors.black.withOpacity(widget.darkBackground ? 0.8 : 0.0),
              child: showMobile ? mobileView() : desktopView(),
            ),
          );
        },
      ),
    );
  }

  Widget desktopView() {
    const double navBarOffset = 80;
    const double footerOffset = 20;
    return SizedBox(
      // the container is a canvas covering the entire screen
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        children: [
          Positioned(
            top: navBarOffset + 25,
            bottom: footerOffset + 30,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: widget.desktopView ?? Container(),
            ),
          ),
          const Positioned(bottom: footerOffset, child: Footer()),
          const Positioned(
            top: navBarOffset,
            child: CustomNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget mobileView() {
    const double navIconOffset = 20;
    const double footerOffset = 20;

    return SizedBox(
      width: screenWidth,
      child: Stack(
        children: [
          Positioned(
            top: navIconOffset + 40,
            bottom: footerOffset + 30,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: widget.mobileView ?? Container(),
            ),
          ),
          Positioned(
            top: navIconOffset,
            right: navIconOffset,
            child: IconButton(
              icon: const Icon(Icons.menu_rounded),
              iconSize: screenWidth < 400 ? 25 : 30,
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              color: Colors.white,
            ),
          ),
          const Positioned(
            bottom: footerOffset,
            child: Footer(),
          ),
        ],
      ),
    );
  }
}
