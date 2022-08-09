enum Streamer {
  spotify,
  appleMusic,
  soundcloud,
  youtube,
  amazonMusic,
  deezer,
  bandcamp,
  tidal,
}

extension StreamerExtension on Streamer {
  // return value must match .svg files in images folder so SvgPicture works
  String getString() {
    switch (this) {
      case Streamer.spotify:
        return "spotify";
      case Streamer.appleMusic:
        return "apple music";
      case Streamer.soundcloud:
        return "soundcloud";
      case Streamer.youtube:
        return "youtube";
      case Streamer.amazonMusic:
        return "amazon music";
      case Streamer.deezer:
        return "deezer";
      case Streamer.bandcamp:
        return "bandcamp";
      case Streamer.tidal:
        return "tidal";
    }
  }

  String getLink() {
    switch (this) {
      case Streamer.spotify:
        return "https://open.spotify.com/artist/5dWRkpyqnoYDNouN02NDdk?si=udvdW8bURFSc8vChUrGOhw";
      case Streamer.appleMusic:
        return "https://music.apple.com/us/artist/delilah-brao/1502059102?mt=1&app=music&at=10luuP";
      case Streamer.soundcloud:
        return "https://soundcloud.com/delilahbrao";
      case Streamer.youtube:
        return "https://www.youtube.com/channel/UCiK1upHNiNAknsnjniVY5BA";
      case Streamer.amazonMusic:
        return "https://music.amazon.com/artists/B085NMYGF3/delilah-brao";
      case Streamer.deezer:
        return "https://www.deezer.com/us/artist/50283052";
      case Streamer.bandcamp:
        return "https://delilahbrao.bandcamp.com/";
      case Streamer.tidal:
        return "https://tidal.com/browse/artist/11907136";
    }
  }
}

enum Social { twitter, tiktok, instagram }

extension SocialExtension on Social {
  // return value must match .svg files in images folder so SvgPicture works

  String getString() {
    switch (this) {
      case Social.twitter:
        return "twitter";
      case Social.tiktok:
        return "tiktok";
      case Social.instagram:
        return "instagram";
    }
  }

  String getLink() {
    switch (this) {
      case Social.twitter:
        return "https://twitter.com/heyoitsbrao";
      case Social.tiktok:
        return "https://www.tiktok.com/@delilahbrao?lang=en";
      case Social.instagram:
        return "https://www.instagram.com/delilahbrao/?hl=en";
    }
  }
}
