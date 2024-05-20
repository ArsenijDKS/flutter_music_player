import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    // Song 1
    Song(
      songName: "Auburn",
      artistName: "Goody Grace",
      albumArtImagePath: "assets/images/Goody Grace - Auburn.jpg",
      audioPath: "audio/Goody_Grace_Auburn.mp3",
    ),

    // Song 2
    Song(
      songName: "Eyes Wide Open",
      artistName: "Gotye",
      albumArtImagePath: "assets/images/Gotye - Eyes Wide Open.png",
      audioPath: "audio/Gotye_Eyes_Wide_Open.mp3",
    ),
  ];

  // current song playing index
  int? _currentSongIndex;

  /*
  
  A U D I O P L A Y E R

  */

  // Audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Durations
  Duration _currentdDuration = Duration.zero;
  Duration _totaldDuration = Duration.zero;

  // Constructor
  PlaylistProvider() {
    ListenToDuration();
  }

  // Initialize not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // Stop the current song
    await _audioPlayer.play(AssetSource(path)); // Play new one
    _isPlaying = true;
    notifyListeners();
  }

  // pause the song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to a spec pos in the song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        // Go to the next song if it's not the last song
        _currentSongIndex = _currentSongIndex! + 1;
      } else {
        // if it's the last song, loop back to the first song
        _currentSongIndex = 0;
      }
    }
  }

  // play previous song
  void playPreviousSong() {
    // if more than 2 seconds have paused, restart the current song
    if (_currentdDuration.inSeconds > 2) {
    } // if it's within first 2 seconds of the song, go to previous song
    else if (_currentSongIndex! > 0) {
      currentSongIndex = _currentSongIndex! - 1;
    } else {
      // if it's the first song, loop back to last song
      currentSongIndex = _playlist.length - 1;
    }
  }

  // listen to duration
  void ListenToDuration() {
    // Listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totaldDuration = newDuration;
      notifyListeners();
    });

    // Listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentdDuration = newPosition;
      notifyListeners();
    });

    // Listen for song completed
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // dispose the audio player

  /*
  G E T T E R S 
  */
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentdDuration;
  Duration get totalDuration => _totaldDuration;

  /*
  S E T T E R S 
  */

  set currentSongIndex(int? newIndex) {
    // Update the current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      // Play the song
      play();
    }

    // Update UI
    notifyListeners();
  }
}
