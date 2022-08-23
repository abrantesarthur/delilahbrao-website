import 'package:delilahbrao/const/nav_action.dart';
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
                style: getActionTextStyle(),
              ),
              rightIcon != null
                  ? Row(
                      children: [
                        const SizedBox(width: 5),
                        Icon(
                          rightIcon,
                          size: 15,
                          color: action.isActive
                              ? Colors.purple[300]
                              : Colors.white,
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

  TextStyle getActionTextStyle() {
    return TextStyle(
      color: action.isActive ? Colors.purple[400] : Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }

  TextStyle getOptionTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }
}
