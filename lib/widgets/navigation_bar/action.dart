import 'package:delilahbrao/const/nav_action.dart';
import 'package:delilahbrao/style.dart';
import 'package:flutter/material.dart';

class NavigationBarAction extends StatelessWidget {
  const NavigationBarAction({
    Key? key,
    required this.action,
    this.onTap,
    this.onHover,
    this.width,
    this.alignment,
    this.padding,
    this.rightIcon,
  }) : super(key: key);

  final CustomAction action;
  final GestureTapCallback? onTap;
  final ValueChanged<bool>? onHover;
  final double? width;
  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;
  final IconData? rightIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      onHover: onHover,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Container(
          width: width ?? 110,
          alignment: alignment ?? Alignment.center,
          child: Row(
            children: [
              Text(
                action.name,
                style: getActionTextStyle(action.isActive),
              ),
              rightIcon != null
                  ? Row(
                      children: [
                        const SizedBox(width: 5),
                        Icon(
                          rightIcon,
                          size: 15,
                          color:
                              action.isActive ? Colors.blue[900] : Colors.white,
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
