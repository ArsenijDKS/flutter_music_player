import 'package:flutter/material.dart';
import 'package:flutter_music_player/components/my_drawer.dart';
import 'package:flutter_music_player/models/playlist_provider.dart';
import 'package:flutter_music_player/models/song.dart';
import 'package:flutter_music_player/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  // Get the playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    // Get the playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  // Go to song
  void goToSong(int songIndex) {
    // Set the current song index
    playlistProvider.currentSongIndex = songIndex;

    // Navigate to the song page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('P L A Y L I S T'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          // Get the playlist
          final List<Song> playlist = value.playlist;

          // Return list view UI
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              // Get invidual song
              final Song song = playlist[index];
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumArtImagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
