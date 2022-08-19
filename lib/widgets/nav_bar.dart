import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    // navigation bar expands to fill the screen
    return Container(
      width: screenWidth,
      color: Colors.green.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: Container()),
          // action without options
          Container(
            width: 100,
            height: 30,
            color: Colors.green.withOpacity(0.7),
          ),
          const SizedBox(width: 5),
          Container(
            width: 100,
            height: 30,
            color: Colors.green.withOpacity(0.7),
          ),

          const SizedBox(width: 5),
          // action with options
          Stack(
            // allow stack items to overflow its boundaries
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 100,
                height: 30,
                color: Colors.green.withOpacity(0.7),
              ),
              Positioned(
                // TODO: has to be 10 more than height
                top: 40,
                child: Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Padding(
                        // TODO: extract into a function
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Container(
                          width: 200,
                          height: 30,
                          color: Colors.green.withOpacity(0.7),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Container(
                          width: 200,
                          height: 30,
                          color: Colors.green.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 5),
          Container(
            width: 100,
            height: 30,
            color: Colors.green.withOpacity(0.7),
          ),
          const SizedBox(width: 5),
          Container(
            width: 100,
            height: 30,
            color: Colors.green.withOpacity(0.7),
          ),
          Flexible(child: Container()),
        ],
      ),
    );
  }
}
