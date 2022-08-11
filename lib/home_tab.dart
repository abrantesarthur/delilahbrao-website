import 'package:delilahbrao/widgets/footer.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 30,
                right: screenWidth / 8,
                left: screenWidth / 8,
              ),
              child: const Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
