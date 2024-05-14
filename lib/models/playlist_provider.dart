import 'package:flutter/material.dart';
import 'package:flutter_music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    // Song 1
    Song(
      songName: "Auburn",
      artistName: "Goody Grace",
      albumArtImagePath: "assets/images/Goody Grace - Auburn.jpg",
      audioPath: "assets/audio/Goody Grace - Auburn.mp3",
    ),

    // Song 2
    Song(
      songName: "Eyes Wide Open",
      artistName: "Gotye",
      albumArtImagePath: "assets/images/Gotye - Eyes Wide Open.png",
      audioPath: "assets/audio/Gotye - Eyes Wide Open.mp3",
    ),
  ];
}
