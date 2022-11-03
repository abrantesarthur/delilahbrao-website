import 'package:delilahbrao/const/links.dart';
import 'package:delilahbrao/homepage.dart';
import 'package:delilahbrao/newsletter.dart';
import 'package:delilahbrao/profile.dart';

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
    link: spotifyLink,
    dropdownOptions: [
      DropdownOption(title: "spotify", link: spotifyLink),
      DropdownOption(title: "apple music", link: appleMusicLink),
      DropdownOption(title: "soundcloud", link: soundcloudLink),
      DropdownOption(title: "amazon music", link: amazonMusicLink),
      DropdownOption(title: "bandcamp", link: bandcampLink),
      DropdownOption(title: "tidal", link: tidalLink),
      DropdownOption(title: "deezer", link: deezerLink),
    ],
  ),
  CustomAction(
    "FOLLOW",
    link: instagramLink,
    dropdownOptions: [
      DropdownOption(title: "instagram", link: instagramLink),
      DropdownOption(title: "twitter", link: twitterLink),
      DropdownOption(title: "tiktok", link: tiktokLink),
      DropdownOption(title: "facebook", link: facebookLink),
      DropdownOption(title: "youtube", link: youtubeLink),
      DropdownOption(title: "twitch", link: twitchLink),
    ],
  ),
  CustomAction(
    "ABOUT",
    routeName: ProfilePage.routeName,
    dropdownOptions: [],
  ),
  CustomAction(
    "NEWSLETTER",
    routeName: NewsletterPage.routeName,
    dropdownOptions: [],
  ),
];
