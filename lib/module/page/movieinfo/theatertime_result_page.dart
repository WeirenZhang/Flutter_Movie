import 'package:flutter/material.dart';
import 'package:movie_flutter/module/model/movieinfo/movietime_result_model.dart';
import 'package:movie_flutter/module/widget/movieinfo/theatertime_result_cell_view.dart';

/// MyComicSearchPage : search page
class TheaterTimeResultPage extends StatefulWidget {
  final List<MovieTimeResult> releaseItem;

  const TheaterTimeResultPage(this.releaseItem, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StoreInfoPageState();
}

class StoreInfoPageState extends State<TheaterTimeResultPage> {
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemCount: widget.releaseItem.length,
      itemBuilder: (context, index) {
        return theatertime_result_cell_view(widget.releaseItem[index]);
      },
    ));
  }
}
