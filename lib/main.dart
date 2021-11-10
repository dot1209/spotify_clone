import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/bottom_nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: BottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
