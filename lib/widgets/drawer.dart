import 'package:delilahbrao/const/nav_action.dart';
import 'package:delilahbrao/style.dart';
import 'package:delilahbrao/widgets/navigation_bar/index.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<bool> displayDropdown = navigationActions.map((_) => false).toList();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView.separated(
        // TODO: add logo on top
        itemBuilder: (context, index) {
          CustomAction action = navigationActions[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Padding(
                  padding: getMobileActionPadding(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        action.name,
                        style: getActionTextStyle(action.isActive),
                      ),
                      action.dropdownOptions.isNotEmpty
                          ? Icon(
                              displayDropdown[index] ? Icons.close : Icons.add,
                              size: 15,
                              color: navigationActions[index].isActive
                                  ? Colors.blue[400]
                                  : Colors.white,
                            )
                          : Container(),
                    ],
                  ),
                ),
                onHover: (a) => _onHoverAction(a, index),
                onTap: () => _onTapAction(index, action),
              ),
              action.dropdownOptions.isNotEmpty && displayDropdown[index]
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...action.dropdownOptions.map(
                          (o) => InkWell(
                            child: Padding(
                              padding: getMobileOptionPadding(),
                              child: Text(
                                o.title,
                                style: getActionTextStyle(o.isActive),
                              ),
                            ),
                            onTap: () {
                              // open link and close drawer
                              html.window.open(o.link, 'new tab');
                              Navigator.of(context).pop();
                            },
                            onHover: (a) => setState(
                              () {
                                o.isActive = a;
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  : Container(),
            ],
          );
        },
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Divider(
            color: Colors.white,
            thickness: 0.18,
          ),
        ),
        itemCount: navigationActions.length,
      ),
    );
  }

  void _onTapAction(int index, CustomAction action) {
    if (navigationActions[index].dropdownOptions.isNotEmpty) {
      setState(() {
        // close other dropdowns and remove their highlhg
        for (var i = 0; i < displayDropdown.length; ++i) {
          if (i != index) {
            displayDropdown[i] = false;
          }
        }
        // remove highlight from other dropdowns
        for (var i = 0; i < navigationActions.length; ++i) {
          if (i != index) {
            navigationActions[i].isActive = false;
          }
        }

        // display this dropdown
        displayDropdown[index] = !displayDropdown[index];

        // set as action as active
        navigationActions[index].isActive = displayDropdown[index];
      });
    } else {
      // close drawer and open link
      Navigator.of(context).pop();
      onTapAction(context, action);
    }
  }

  void _onHoverAction(bool active, int index) {
    setState(
      () {
        if (!displayDropdown[index]) {
          navigationActions[index].isActive = active;
        }
      },
    );
  }
}
