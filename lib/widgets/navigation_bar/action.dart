import 'package:flutter/material.dart';

class NavigationBarAction extends StatelessWidget {
  const NavigationBarAction({
    Key? key,
    required this.title,
    required this.isActive,
    this.onTap,
    this.onHover,
    this.width,
    this.alignment,
    this.padding,
  }) : super(key: key);

  final String title;
  final bool isActive;
  final GestureTapCallback? onTap;
  final ValueChanged<bool>? onHover;
  final double? width;
  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      onHover: onHover,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Container(
          width: width ?? 100,
          alignment: alignment ?? Alignment.center,
          child: Text(
            title,
            style: getActionTextStyle(),
          ),
        ),
      ),
    );
  }

  TextStyle getActionTextStyle() {
    return TextStyle(
      color: isActive ? Colors.red : Colors.white,
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
