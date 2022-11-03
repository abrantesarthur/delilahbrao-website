import 'package:delilahbrao/homepage.dart';
import 'package:delilahbrao/newsletter.dart';
import 'package:delilahbrao/profile.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyWebsite());
}

// ignore: must_be_immutable
class MyWebsite extends StatelessWidget {
  const MyWebsite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Delilah Brao",
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      routes: {
        NewsletterPage.routeName: (context) => const NewsletterPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
      },
      home: const HomePage(),
    );
  }
}
