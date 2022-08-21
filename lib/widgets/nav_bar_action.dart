import 'package:flutter/material.dart';

class NavigationBarAction extends StatelessWidget {
  NavigationBarAction({
    Key? key,
    required this.title,
    this.onTap,
    this.onHover,
    this.width,
    this.alignment,
  }) : super(key: key);

  String title;
  GestureTapCallback? onTap;
  ValueChanged<bool>? onHover;
  double? width;
  Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      onHover: onHover,
      child: Container(
        width: width ?? 100,
        color: Colors.green.withOpacity(0.3),
        alignment: alignment ?? Alignment.center,
        child: Text(
          title,
          style: getActionTextStyle(),
        ),
      ),
    );
  }

  TextStyle getActionTextStyle() {
    return const TextStyle(
      color: Colors.white,
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
