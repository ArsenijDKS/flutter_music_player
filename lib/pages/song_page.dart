import 'package:flutter/material.dart';
import 'package:flutter_music_player/components/neu_box.dart';
import 'package:flutter_music_player/models/playlist_provider.dart';
import 'package:flutter_music_player/models/song.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
              bottom: 25.0,
            ),
            child: Column(
              children: [
                // App bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back),
                    ),

                    // Title
                    Text("P L A Y L I S T"),

                    // Menu button
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                  ],
                ),

                // Album artwork
                NeuBox(
                  child: Column(
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                            "assets/images/Goody Grace - Auburn.jpg"),
                      ),

                      // Song and Artist name, icon
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Song and artist name
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Auburn",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text("Goody Grace"),
                              ],
                            ),

                            // Heart icon
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Song duration progress
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Start time
                          Text("0:00"),

                          // Shuffle icon
                          Icon(Icons.shuffle),

                          // Repeat icon
                          Icon(Icons.repeat),

                          // End time
                          Text("0:00"),
                        ],
                      ),
                      Slider(
                        min: 0,
                        max: 100,
                        value: 50,
                        activeColor: Colors.green,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                )

                // Playback controls
              ],
            ),
          ),
        ),
      ),
    );
  }
}
