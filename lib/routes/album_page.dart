// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const AlbumPageApp());
}

class AlbumPageApp extends StatelessWidget {
  const AlbumPageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // using a custom ScrollBehavior so that the experience is the same for everyone
      scrollBehavior: const ConstantScrollBehavior(),
      title: "ALBUM",
      home: Scaffold(
        backgroundColor: Colors.black,
        body: const CustomScrollView(
          slivers: <Widget> [
            AlbumPageAppBar(),
            AlbumWidget(),
            OthersWidget(),
            RecommendedWidget(),
          ],
        ),
      ),
    );
  }
}

class AlbumPageAppBar extends StatelessWidget {
  const AlbumPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SliverAppBar(
      pinned: true,
      // floating: true,
      // title: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      //   child: Text("Butterfly Effect"),
      // ),
      expandedHeight: 500.0,
      // use to decorate flexible area, including images and text on it
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: <Widget> [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,  
                  colors: <Color> [
                    Colors.grey[500]!,
                    Colors.grey[900]!,
                  ],
                ),
              ),
            ),
            Center(
              child: Image.asset(
                albumPageURL,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            AlbumCoverComponent(textTheme: textTheme),
          ],  
        ),
      ),
    );
  }
}

class AlbumCoverComponent extends StatelessWidget {
  const AlbumCoverComponent({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                child: Text("Butterfly Effect", style: textTheme.headline5),
              ),
              Row(
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                        artistPhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text("BOL4"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: const Text("Album．2021"),
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite_border),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ],
          ),
        ),
        PlayButtom(),
        PreviousPageBottom()
      ],
    );
  }
}

class PreviousPageBottom extends StatelessWidget {
  const PreviousPageBottom({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 70),
      child: Icon(
        Icons.keyboard_backspace_sharp,
        size: 30,
      ),
    );
  }
}

class PlayButtom extends StatelessWidget {
  const PlayButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Stack(
        children:[
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.play_circle,
              color: Colors.green,
              size: 70,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.shuffle_rounded,
              size: 30,
            ),
          ),
        ], 
      ), 
    );
  }
}

class AlbumWidget extends StatelessWidget {
  const AlbumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final albumInfo = Server.getAlbumInfoByID(index);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              color: Colors.black,
              child: ListTile(
                title: Text(
                  albumInfo.title,
                  style: textTheme.headline5,
                ),
                subtitle: Text(
                  albumInfo.artist,
                ),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          );
        },
        childCount: 7,
      ),
    );
  }
}

class OthersWidget extends StatelessWidget {
  const OthersWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsetsDirectional.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("2021-10-26", style: textTheme.headline6),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("7 songs．25 min", style: textTheme.subtitle1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: ClipOval(
                      child: Image.network(
                        artistPhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  Text("BOL4", style: textTheme.headline6),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("你可能還會喜歡", style: textTheme.headline5),
            )
          ],
        ),
      ),
    );
  }
}

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Container(
        height: 500,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            final recommended = Server.getRecommendAlbumByID(index);
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Image.network(
                    recommended.imgURL,
                    width: 300,
                    height: 300,
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Text(
                    recommended.title,
                    style: textTheme.headline6,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// create an album info about the artist
class Server {
  static List<AlbumInfo> getAlbumList() => _albumInfo.values.toList();
  static AlbumInfo getAlbumInfoByID(int id) {
    assert(id >= 0 && id <= 7);
    return _albumInfo[id]!;
  }

  static Recommended getRecommendAlbumByID(int id) {
    assert(id >= 0 && id <= 3);
    return _recommended[id]!;
  }
}

const String albumPageURL =
    "assets/images/artist.jpg";
const String redDiaryPage1URL = 
    "https://i.kfs.io/album/tw/103878115,1v1/fit/500x500.jpg";
const String redDiaryPage2URL = 
    "https://i.kfs.io/album/tw/103878559,1v1/fit/500x500.jpg";
const String twoFiveURL = 
    "https://www.kpopn.com/upload/d58e6fabc1d3586c598c.jpg";

const String othersURL =
    "https://pic.baike.soso.com/ugc/baikepic2/19239/cut-20180916211509-676014892_jpg_517_344_8142.jpg/800";
const String artistPhoto =
    "https://i.kfs.io/artist/global/7309304,0v18/fit/300x300.jpg";

class Recommended {
  const Recommended({
    required this.imgURL,
    required this.title,
  });
  final String imgURL;
  final String title;
}

final Image redDiaryPage1 = Image.network(redDiaryPage1URL);
final Image redDiaryPage2 = Image.network(redDiaryPage2URL);
final Image twoFive = Image.network(twoFiveURL);

//TODO: Add recommended data
Map<int, Recommended> _recommended = {
  0: Recommended(imgURL: redDiaryPage1URL, title: "Red Diary Page 1"),
  1: Recommended(imgURL: redDiaryPage2URL, title: "Red Diary Page 2"),
  2: Recommended(imgURL: twoFiveURL, title: "Two Five"),
};

class AlbumInfo {
  const AlbumInfo({
    required this.title,
    required this.artist,
    required this.hiRes,
  });
  final String title;
  final String artist;
  final bool hiRes;
}

const Map<int, AlbumInfo> _albumInfo = {
  0: AlbumInfo(title: "Butterfly Effect", artist: "BOL4", hiRes: true),
  1: AlbumInfo(title: "Space", artist: "BOL4", hiRes: true),
  2: AlbumInfo(title: "Some", artist: "BOL4", hiRes: true),
  3: AlbumInfo(title: "Blue", artist: "BOL4", hiRes: true),
  4: AlbumInfo(title: "Fix me", artist: "BOL4", hiRes: true),
  5: AlbumInfo(title: "Imagine", artist: "BOL4", hiRes: true),
  6: AlbumInfo(title: "To My Youth", artist: "BOL4", hiRes: true),
};

class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();

  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
