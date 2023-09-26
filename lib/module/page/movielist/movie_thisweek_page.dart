import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movielist/movie_thisweek_widget.dart';

/// MyComicSearchPage : search page
class MovieThisWeekPage extends StatefulWidget {
  const MovieThisWeekPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieThisWeekPageState();
}

class MovieThisWeekPageState extends State<MovieThisWeekPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("本周新片"),
          centerTitle: true,
        ),
        body: const MovieThisWeekWidget());
  }
}
