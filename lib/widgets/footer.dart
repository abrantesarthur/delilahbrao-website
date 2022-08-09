import 'package:delilahbrao/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class Icon {
  final String name;
  final String link;

  Icon({required this.name, required this.link});
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        bottom: 30,
        right: screenWidth / 8,
        left: screenWidth / 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: getIcons(),
      ),
    );
  }

  List<Widget> getIcons() {
    List<Streamer> streamersToHide = [
      Streamer.amazonMusic,
      Streamer.deezer,
      Streamer.bandcamp,
      Streamer.tidal,
    ];

    // fold Streamer into list of Icons to display
    List<Icon> streamerIcons = Streamer.values.fold([], (icons, s) {
      if (!streamersToHide.contains(s)) {
        icons.add(Icon(name: s.getString(), link: s.getLink()));
      }
      return icons;
    });

    // fold Social into list of Icons to display
    List<Icon> socialIcons = Social.values
        .map((s) => Icon(name: s.getString(), link: s.getLink()))
        .toList();

    return (streamerIcons + socialIcons)
        .map((icon) => FooterIcon(icon))
        .toList();
  }
}

class FooterIcon extends StatefulWidget {
  const FooterIcon(this.icon, {Key? key}) : super(key: key);

  final Icon icon;

  @override
  State<StatefulWidget> createState() => _FooterIconState();
}

class _FooterIconState extends State<FooterIcon> {
  String colorSuffix = "";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          colorSuffix = value ? " red" : "";
        });
      },
      child: SvgPicture.asset(
        "images/" + widget.icon.name + colorSuffix + ".svg",
        width: 30,
      ),
      onTap: () => {html.window.open(widget.icon.link, 'new tab')},
    );
  }
}
