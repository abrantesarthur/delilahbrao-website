import 'package:delilahbrao/template.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsletterPage extends StatelessWidget {
  NewsletterPage({Key? key}) : super(key: key);
  static String routeName = "/newsletter";

  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Template(
      darkBackground: true,
      desktopView: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            "SIGN UP / COLLABORATE / JUST SAY HI",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          // TODO: extract into a form widget
          Container(
            width: calculateFormWidth(),
            child: Form(
              child: Column(
                children: [],
              ),
            ),
          ),
        ],
      ),
      mobileView: Column(
        children: [
          Container(
            color: Colors.red,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          )
        ],
      ),
    );
  }

  double calculateFormWidth() {
    return screenWidth < 800 ? 500 : 800;
  }
}
