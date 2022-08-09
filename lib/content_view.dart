import 'package:flutter/material.dart';

class ContentView {
  const ContentView({Key? key, required this.tab, required this.content})
      : super(key: key);

  final CustomTab tab;
  final Widget content;
}
