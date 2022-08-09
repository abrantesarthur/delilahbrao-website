import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
