import 'package:delilahbrao/widgets/nav_bar_action.dart';
import 'package:delilahbrao/widgets/overlay.dart';
import 'package:flutter/material.dart';

class NavigationBarDropdwon extends StatelessWidget {
  const NavigationBarDropdwon({
    Key? key,
    required this.options,
    required this.onHover,
  }) : super(key: key);

  final List<String> options;
  final ValueChanged<bool> onHover;

  @override
  Widget build(BuildContext context) {
    return OverlayWidget(
      verticalOffset: 105,
      onHover: onHover,
      child: Container(
        color: Colors.black.withOpacity(0.6),
        child: Column(
          children: [
            ...options
                .map(
                  (option) => Padding(
                    child: NavigationBarAction(
                      title: option,
                      width: 200,
                      alignment: Alignment.centerLeft,
                    ),
                    padding: const EdgeInsets.only(
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
    );
  }
}
