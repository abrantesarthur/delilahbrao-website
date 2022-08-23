import 'package:flutter/material.dart';

TextStyle getActionTextStyle(bool isActive) {
  return TextStyle(
    color: isActive ? Colors.purple[400] : Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
}

const double _mobileActionPadding = 10;

EdgeInsets getMobileActionPadding() {
  return const EdgeInsets.all(_mobileActionPadding);
}

EdgeInsets getMobileOptionPadding() {
  return const EdgeInsets.only(
    left: 3 * _mobileActionPadding,
    top: _mobileActionPadding,
    bottom: _mobileActionPadding,
  );
}
