import 'package:delilahbrao/const/nav_action.dart';
import 'package:delilahbrao/homepage.dart';
import 'package:delilahbrao/widgets/nav_bar_action.dart';
import 'package:delilahbrao/widgets/nav_bar_dropdown.dart';
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

    return SizedBox(
      // navigation bar expands to fill the screen
      width: screenWidth,
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
                      ? NavigationBarAction(
                          title: action.name,
                          onHover: onHoverAction,
                        )
                      : Stack(
                          // allow stack items to overflow its boundaries
                          clipBehavior: Clip.none,
                          children: [
                            NavigationBarAction(
                              title: action.name,
                              onHover: (v) => onHoverDropdownAction(v, index),
                            ),
                            displayDropdowns[index]
                                ? NavigationBarDropdwon(
                                    options: action.dropdownOptions,
                                    onHover: (v) => onHoverDropdown(v, index),
                                  )
                                : Container(),
                          ],
                        ),
                  // don't add space after last action
                  index != navigationActions.length - 1
                      ? const SizedBox(width: 5)
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

  void hideDropdowns() {
    for (var i = 0; i < displayDropdowns.length; ++i) {
      displayDropdowns[i] = false;
    }
  }

  void onHoverAction(bool active) {
    if (active) {
      if (active) {
        hideDropdowns();
        setState(() {});
      }
    }
  }

  void onHoverDropdownAction(bool active, int index) {
    if (active) {
      hideDropdowns();
      displayDropdowns[index] = true;
      setState(() {});
    } else {
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          if (!dropdownIsActive[index]) {
            displayDropdowns[index] = false;
          }
        });
      });
    }
  }

  void onHoverDropdown(bool active, int index) {
    setState(() {
      dropdownIsActive[index] = active;
      displayDropdowns[index] = active;
    });
  }
}
