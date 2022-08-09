import 'package:delilahbrao/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWebsite());
}

class MyWebsite extends StatelessWidget {
  const MyWebsite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Delilah Brao",
      home: HomePage(),
    );
  }
}
