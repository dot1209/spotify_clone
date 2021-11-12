import 'package:flutter/material.dart';
import 'package:spotify_clone/routes/home_page.dart';
import 'package:spotify_clone/routes/search_page.dart';
import 'package:spotify_clone/routes/library_page.dart';
import 'package:spotify_clone/routes/premium_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    SearchPage(),
    LibraryPage(),
    PremiumPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '首頁'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜尋'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music), label: '你的音樂庫'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Premium'),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
