import 'package:delilahbrao/const/footer_icons.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:flutter_svg/svg.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(child: Container()),
          ...footerIcons.asMap().entries.map((e) {
            FooterIcon icon = e.value;
            int index = e.key;
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                onTap: () => html.window.open(icon.link, "new tab"),
                onHover: (v) => setState(() {
                  footerIcons[index].isActive = v;
                }),
                child: SvgPicture.asset(
                  icon.isActive ? icon.activePath : icon.path,
                  width: 25,
                ),
              ),
            );
          }),
          Flexible(child: Container()),
        ],
      ),
    );
  }
}
