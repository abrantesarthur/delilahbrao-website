import 'package:delilahbrao/const/nav_action.dart';
import 'package:delilahbrao/homepage.dart';
import 'package:delilahbrao/widgets/nav_bar_action.dart';
import 'package:delilahbrao/widgets/overlay.dart';
import 'package:flutter/material.dart';

/**
 * TODO: fix problem with hovering
 *    the issue is the InkWell is inside a Positioned.
 *    see here https://github.com/flutter/flutter/issues/104519
 */

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  CustomNavigationBarState createState() => CustomNavigationBarState();
}

class CustomNavigationBarState extends State<CustomNavigationBar> {
  late double screenWidth;

  List<bool> displayDropdowns = navigationActions.map((a) => false).toList();
  List<bool> dropdownIsActive = navigationActions.map((a) => false).toList();

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
                      ? NavigationBarAction(
                          title: action.name,
                          onHover: (v) {
                            if (v) {
                              // remove other dropdowns when hovering over an action
                              for (var i = 0;
                                  i < displayDropdowns.length;
                                  ++i) {
                                displayDropdowns[i] = false;
                              }
                              setState(() {});
                            }
                          },
                        )
                      // TODO: extract this into a different component
                      : Stack(
                          // allow stack items to overflow its boundaries
                          clipBehavior: Clip.none,
                          children: [
                            NavigationBarAction(
                              title: action.name,
                              onHover: (active) {
                                if (active) {
                                  // hide other dropdowns
                                  for (var i = 0;
                                      i < displayDropdowns.length;
                                      ++i) {
                                    displayDropdowns[i] = false;
                                  }
                                  // display this dropdown
                                  setState(() {
                                    displayDropdowns[index] = true;
                                  });
                                } else {
                                  Future.delayed(
                                      const Duration(milliseconds: 100), () {
                                    setState(() {
                                      if (!dropdownIsActive[index]) {
                                        displayDropdowns[index] = false;
                                      }
                                    });
                                  });
                                }
                              },
                            ),
                            displayDropdowns[index]
                                ? OverlayWidget(
                                    verticalOffset: 105,
                                    onHover: (active) {
                                      setState(() {
                                        dropdownIsActive[index] = active;
                                        displayDropdowns[index] = active;
                                      });
                                    },
                                    child: Container(
                                      color: Colors.black.withOpacity(0.6),
                                      child: Column(
                                        children: [
                                          ...action.dropdownOptions
                                              .map(
                                                (option) => Padding(
                                                  child: NavigationBarAction(
                                                    title: option,
                                                    width: 200,
                                                    alignment:
                                                        Alignment.centerLeft,
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
                                    ))
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
