import 'package:flutter/material.dart';

class CustomInkWell extends StatefulWidget {
  const CustomInkWell({
    Key? key,
    this.onHover,
    required this.child,
  }) : super(key: key);

  final ValueChanged<bool>? onHover;
  final Widget child;

  @override
  _CustomInkWellState createState() => _CustomInkWellState();
}

class _CustomInkWellState extends State<CustomInkWell> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onExit: (_) => widget.onHover!(false),
      onHover: (_) => widget.onHover!(true),
      child: widget.child,
    );
  }
}
