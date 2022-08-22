import 'package:delilahbrao/const/nav_action.dart';
import 'package:delilahbrao/widgets/nav_bar_action.dart';
import 'package:delilahbrao/widgets/nav_bar_dropdown.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

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
                          isActive: action.isActive,
                          onHover: (v) => onHoverAction(v, index),
                          onTap: () => onTapAction(context, action),
                        )
                      : Stack(
                          // allow stack items to overflow its boundaries
                          clipBehavior: Clip.none,
                          children: [
                            NavigationBarAction(
                              title: action.name,
                              isActive: action.isActive,
                              onHover: (v) => onHoverDropdownAction(v, index),
                              onTap: () => onTapAction(context, action),
                            ),
                            displayDropdowns[index]
                                ? NavigationBarDropdown(
                                    options: action.dropdownOptions,
                                    onHover: (v) => onHoverDropdown(v, index),
                                  )
                                : Container(),
                          ],
                        ),
                  // don't add space after last actionr
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

  void onHoverAction(bool active, int actionIndex) {
    if (active) {
      hideDropdowns();
    }
    // mark the action as active for hovering effects
    navigationActions[actionIndex].isActive = active;
    setState(() {});
  }

  void onTapAction(BuildContext context, CustomAction action) {
    if (action.link != null) {
      html.window.open(action.link ?? "", "new tab");
    } else if (action.routeName != null &&
        ModalRoute.of(context)?.settings.name != action.routeName) {
      Navigator.pushNamed(context, action.routeName ?? "/");
    }
  }

  void onHoverDropdownAction(bool active, int index) {
    if (active) {
      hideDropdowns();
      displayDropdowns[index] = true;
      navigationActions[index].isActive = true;
      setState(() {});
    } else {
      navigationActions[index].isActive = false;
      Future.delayed(const Duration(milliseconds: 2000), () {
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
      navigationActions[index].isActive = active;
    });
  }
}
