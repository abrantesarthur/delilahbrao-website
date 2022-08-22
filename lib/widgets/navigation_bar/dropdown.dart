import 'package:delilahbrao/const/nav_action.dart';
import 'package:delilahbrao/widgets/navigation_bar/action.dart';
import 'package:delilahbrao/widgets/navigation_bar/dropdown_option.dart';
import 'package:delilahbrao/widgets/overlay.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class NavigationBarDropdown extends StatefulWidget {
  const NavigationBarDropdown({
    Key? key,
    required this.options,
    required this.onHover,
  }) : super(key: key);

  final List<DropdownOption> options;
  final ValueChanged<bool> onHover;

  @override
  _NavigationBarDropdownState createState() => _NavigationBarDropdownState();
}

class _NavigationBarDropdownState extends State<NavigationBarDropdown> {
  @override
  Widget build(BuildContext context) {
    return OverlayWidget(
      verticalOffset: 105,
      child: Container(
        color: Colors.black.withOpacity(0.6),
        child: Column(
          children: [
            ...widget.options.asMap().entries.map((e) {
              DropdownOption option = e.value;
              int index = e.key;
              return NavigationBarOption(
                title: option.title,
                isActive: option.isActive,
                width: 200,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 5,
                  bottom: 5,
                ),
                onTap: () {
                  debugPrint(option.link);
                  html.window.open(option.link, "new tab");
                },
                onHover: (active) {
                  widget.options[index].isActive = active;
                  widget.onHover(active);
                  setState(() {});
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
