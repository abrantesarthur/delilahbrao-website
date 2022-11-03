import 'package:delilahbrao/const/links.dart';
import 'package:delilahbrao/template.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String routeName = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color? textButtonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Template(
      darkBackground: true,
      backgroundOpacity: 0.35,
      desktopView: buildView(),
      mobileView: buildView(),
    );
  }

  Widget buildView() => Center(
        child: SingleChildScrollView(
          child: TextButton(
            onHover: (v) => setState(() {
              textButtonColor = v ? Colors.blue[900] : Colors.white;
            }),
            onPressed: () => html.window.open(spotifyLink, 'new tab'),
            child: Text(
              "s t r e a m    m y    m u s i c",
              style: TextStyle(
                color: textButtonColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
}
