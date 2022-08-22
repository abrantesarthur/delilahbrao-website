import 'package:delilahbrao/homepage.dart';

class DropdownOption {
  final String title;
  final String link;
  bool isActive;

  DropdownOption({
    required this.title,
    required this.link,
    this.isActive = false,
  });
}

class CustomAction {
  final String name;
  final List<DropdownOption> dropdownOptions;
  final String? link;
  final String? routeName;
  bool isActive; // whether we are hovering over the action

  CustomAction(
    this.name, {
    required this.dropdownOptions,
    this.link,
    this.routeName,
    this.isActive = false,
  });
}

List<CustomAction> navigationActions = [
  CustomAction(
    "HOME",
    routeName: HomePage.routeName,
    dropdownOptions: [],
  ),
  CustomAction(
    "LISTEN",
    link:
        "https://open.spotify.com/artist/5dWRkpyqnoYDNouN02NDdk?si=udvdW8bURFSc8vChUrGOhw&nd=1",
    dropdownOptions: [
      DropdownOption(
          title: "spotify",
          link:
              "https://open.spotify.com/artist/5dWRkpyqnoYDNouN02NDdk?si=udvdW8bURFSc8vChUrGOhw&nd=1"),
      DropdownOption(
          title: "apple music",
          link:
              "https://music.apple.com/us/artist/delilah-brao/1502059102?mt=1&app=music&at=10luuP"),
      DropdownOption(
          title: "soundcloud", link: "https://soundcloud.com/delilahbrao"),
      DropdownOption(
          title: "amazon music",
          link: "https://music.amazon.com/artists/B085NMYGF3/delilah-brao"),
      DropdownOption(
          title: "bandcamp", link: "https://delilahbrao.bandcamp.com"),
      DropdownOption(
          title: "tidal", link: "https://tidal.com/browse/artist/11907136"),
      DropdownOption(
          title: "deezer", link: "https://www.deezer.com/us/artist/50283052"),
    ],
  ),
  CustomAction(
    "FOLLOW",
    link: "https://www.instagram.com/delilahbrao/?hl=en",
    dropdownOptions: [
      DropdownOption(
          title: "instagram",
          link: "https://www.instagram.com/delilahbrao/?hl=en"),
      DropdownOption(title: "twitter", link: "https://twitter.com/heyoitsbrao"),
      DropdownOption(
          title: "tiktok", link: "https://www.tiktok.com/@delilahbrao?lang=en"),
      DropdownOption(title: "facebook", link: ""),
      DropdownOption(
          title: "youtube",
          link: "https://www.youtube.com/channel/UCiK1upHNiNAknsnjniVY5BA"),
      DropdownOption(title: "twitch", link: ""),
    ],
  ),
  CustomAction(
    "ABOUT",
    dropdownOptions: [],
  ),
  CustomAction(
    "NEWSLETTER",
    dropdownOptions: [],
  ),
];
