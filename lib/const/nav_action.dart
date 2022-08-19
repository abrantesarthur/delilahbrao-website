class CustomAction {
  final String name;
  final List<String> dropdownOptions;

  CustomAction(this.name, {required this.dropdownOptions});
}

List<CustomAction> navigationActions = [
  CustomAction("HOME", dropdownOptions: []),
  CustomAction(
    "LISTEN",
    dropdownOptions: [
      "spotify",
      "apple music",
      "soundcloud",
      "amazon music",
      "bandcamp",
      "tidal",
      "deezer",
    ],
  ),
  CustomAction(
    "FOLLOW",
    dropdownOptions: [
      "instagram",
      "twitter",
      "tiktok",
      "facebook",
      "youtube",
      "twitch",
    ],
  ),
  CustomAction("ABOUT", dropdownOptions: []),
  CustomAction("NEWSLETTER", dropdownOptions: []),
];
