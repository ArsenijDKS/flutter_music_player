import 'package:flutter/material.dart';
import 'package:flutter_music_player/pages/home_page.dart';
import 'package:flutter_music_player/themes/dark_mode.dart';
import 'package:flutter_music_player/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: lightMode,
    );
  }
}
