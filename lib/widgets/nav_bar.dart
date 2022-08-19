import 'package:delilahbrao/const/nav_action.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late double screenWidth;

  List<bool> displayDropdowns = navigationActions.map((a) => false).toList();

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
          ...navigationActions.asMap().entries.map(
            (e) {
              CustomAction action = e.value;
              int index = e.key;
              return Row(
                children: [
                  action.dropdownOptions.isEmpty
                      // TODO: remove container and leave only child text
                      ? Container(
                          width: 100,
                          height: 30,
                          color: Colors.green.withOpacity(0.7),
                          alignment: Alignment.center,
                          child: Text(
                            action.name,
                          ),
                        )
                      // TODO: extract this into a different component
                      : Stack(
                          // allow stack items to overflow its boundaries
                          clipBehavior: Clip.none,
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 30,
                                color: Colors.green.withOpacity(0.7),
                                alignment: Alignment.center,
                                child: Text(action.name),
                              ),
                              onTap: () {},
                              onHover: (_) {
                                debugPrint("hovered");
                                setState(() {
                                  displayDropdowns[index] =
                                      !displayDropdowns[index];
                                });
                              },
                            ),
                            // TODO: display only when hovering
                            displayDropdowns[index]
                                ? Positioned(
                                    // TODO: has to be 10 more than height
                                    top: 40,
                                    child: Container(
                                      color: Colors.black,
                                      child: Column(
                                        children: [
                                          ...action.dropdownOptions
                                              .map(
                                                (option) => Padding(
                                                  child: Container(
                                                    width: 200,
                                                    height: 30,
                                                    alignment: Alignment.center,
                                                    color: Colors.green
                                                        .withOpacity(0.7),
                                                    child: Text(option),
                                                  ),
                                                  // TODO: extract into a function
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 5,
                                                    bottom: 5,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                  // don't add space after last action
                  index != navigationActions.length - 1
                      ? SizedBox(width: 5)
                      : Container(),
                ],
              );
            },
          ).toList(),
          Flexible(child: Container()),
        ],
      ),
    );
  }
}
