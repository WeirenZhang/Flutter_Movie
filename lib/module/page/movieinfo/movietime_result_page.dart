import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movieinfo/movietime_result_widget.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';

/// MyComicSearchPage : search page
class MovieTimeResultPage extends StatefulWidget {
  final ReleaseItemModel releaseItem;

  const MovieTimeResultPage(this.releaseItem, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieTimeResultPageState();
}

class MovieTimeResultPageState extends State<MovieTimeResultPage> {
  Widget build(BuildContext context) {
    return Scaffold(body: MovieTimeResultWidget(widget.releaseItem));
  }
}
