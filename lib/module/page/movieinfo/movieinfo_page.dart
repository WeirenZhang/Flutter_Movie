import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movieinfo/movieinfo_widget.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';

/// MyComicSearchPage : search page
class MovieInfoPage extends StatefulWidget {
  final ReleaseItemModel releaseItem;
  const MovieInfoPage(this.releaseItem, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieInfoPageState();
}

class MovieInfoPageState extends State<MovieInfoPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: MovieInfoWidget(widget.releaseItem));
  }
}
