import 'package:delilahbrao/const/biography.dart';
import 'package:delilahbrao/template.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Template(
      darkBackground: true,
      backgroundOpacity: 1,
      desktopView: buildView(context),
      mobileView: buildView(context),
    );
  }

  Widget buildView(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            width: 190.0,
            height: 190.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("images/profile.jpg"),
              ),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: screenWidth < 500
                ? screenWidth / 1.2
                : screenWidth < 700
                    ? screenWidth / 1.5
                    : screenWidth / 2,
            child: const Text(
              biography,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
                letterSpacing: 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
