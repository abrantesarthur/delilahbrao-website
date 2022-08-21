import 'package:delilahbrao/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyWebsite());
}

// ignore: must_be_immutable
class MyWebsite extends StatelessWidget {
  MyWebsite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Delilah Brao",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
