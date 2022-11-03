import 'package:delilahbrao/widgets/footer.dart';

class FooterIcon {
  final String path;
  final String activePath;
  final String link;
  bool isActive;

  FooterIcon({
    required this.path,
    required this.activePath,
    required this.link,
    this.isActive = false,
  });
}

List<FooterIcon> footerIcons = [
  FooterIcon(
    path: "images/spotify.svg",
    activePath: "images/spotify red.svg",
    link:
        "https://open.spotify.com/artist/5dWRkpyqnoYDNouN02NDdk?si=udvdW8bURFSc8vChUrGOhw&nd=1",
  ),
  FooterIcon(
    path: "images/apple music.svg",
    activePath: "images/apple music active.svg",
    link:
        "https://music.apple.com/us/artist/delilah-brao/1502059102?mt=1&app=music&at=10luuP",
  ),
  FooterIcon(
    path: "images/soundcloud.svg",
    activePath: "images/soundcloud active.svg",
    link: "https://soundcloud.com/delilahbrao",
  ),
  FooterIcon(
    path: "images/twitter.svg",
    activePath: "images/twitter active.svg",
    link: "https://twitter.com/heyoitsbrao",
  ),
  FooterIcon(
    path: "images/youtube.svg",
    activePath: "images/youtube active.svg",
    link: "https://www.youtube.com/channel/UCiK1upHNiNAknsnjniVY5BA",
  ),
  FooterIcon(
    path: "images/tiktok.svg",
    activePath: "images/tiktok active.svg",
    link: "https://www.tiktok.com/@delilahbrao?lang=en",
  ),
  FooterIcon(
    path: "images/instagram.svg",
    activePath: "images/instagram active.svg",
    link: "https://www.instagram.com/delilahbrao/?hl=en",
  ),
];
