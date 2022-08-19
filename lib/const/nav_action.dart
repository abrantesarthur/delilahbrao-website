class CustomAction {
  final String name;
  final List<String>? dropdownOptions;

  CustomAction(this.name, {this.dropdownOptions});
}

List<CustomAction> actions = [
  CustomAction("home"),
  CustomAction(
    "listen",
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
    "follow",
    dropdownOptions: [
      "instagram",
      "twitter",
      "tiktok",
      "facebook",
      "youtube",
      "twitch",
    ],
  ),
  CustomAction("about"),
  CustomAction("newsletter"),
];
