import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/theater_list/theater_area_widget.dart';

/// MyComicSearchPage : search page
class TheaterAreaPage extends StatefulWidget {
  const TheaterAreaPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TheaterAreaPageState();
}

class TheaterAreaPageState extends State<TheaterAreaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("電影院"),
          centerTitle: true,
        ),
        body: const TheaterAreaWidget());
  }
}
