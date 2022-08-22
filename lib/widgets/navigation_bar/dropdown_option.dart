import 'package:delilahbrao/const/nav_action.dart';
import 'package:delilahbrao/widgets/custom_inkwell.dart';
import 'package:flutter/material.dart';

class NavigationBarOption extends StatelessWidget {
  const NavigationBarOption({
    Key? key,
    required this.option,
    this.onTap,
    this.onHover,
    this.width,
    this.alignment,
    this.padding,
  }) : super(key: key);

  final DropdownOption option;
  final GestureTapCallback? onTap;
  final ValueChanged<bool>? onHover;
  final double? width;
  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onHover: onHover,
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: Container(
            width: width ?? 100,
            alignment: alignment ?? Alignment.center,
            child: Text(
              option.title,
              style: getActionTextStyle(),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle getActionTextStyle() {
    return TextStyle(
      color: option.isActive ? Colors.red : Colors.white,
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
