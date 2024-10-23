import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movielist/movie_list_widget.dart';

/// MyComicSearchPage : search page
class MovieListPage extends StatefulWidget {
  final String home_id;
  final String title;
  const MovieListPage(this.home_id, this.title, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieListPageState();
}

class MovieListPageState extends State<MovieListPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: MovieListWidget(widget.home_id));
  }
}
