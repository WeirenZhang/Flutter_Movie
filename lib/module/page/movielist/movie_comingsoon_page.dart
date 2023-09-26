import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movielist/movie_comingsoon_widget.dart';

/// MyComicSearchPage : search page
class MovieComingSoonPage extends StatefulWidget {
  const MovieComingSoonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieComingSoonPageState();
}

class MovieComingSoonPageState extends State<MovieComingSoonPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("即將上映"),
          centerTitle: true,
        ),
        body: const MovieComingSoonWidget());
  }
}
