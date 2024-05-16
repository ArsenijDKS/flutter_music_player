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

  // current song playing index
  int? _currentSongIndex;

  /*
  G E T T E R S 
  */
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  /*
  S E T T E R S 
  */

  set currentSongIndex(int? newIndex) {
    // Update the current song index
    _currentSongIndex = newIndex;

    // Update UI
    notifyListeners();
  }
}
