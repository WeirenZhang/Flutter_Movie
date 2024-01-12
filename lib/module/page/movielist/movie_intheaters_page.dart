import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movielist/movie_intheaters_widget.dart';

/// MyComicSearchPage : search page
class MovieInTheatersPage extends StatefulWidget {
  const MovieInTheatersPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieInTheatersPageState();
}

class MovieInTheatersPageState extends State<MovieInTheatersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("即將上映"),
          centerTitle: true,
        ),
        body: const MovieInTheatersWidget());
  }
}
