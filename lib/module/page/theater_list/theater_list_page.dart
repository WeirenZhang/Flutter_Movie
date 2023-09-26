import 'package:flutter/material.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:movie_flutter/module/widget/theater_list/theater_list_cell_view.dart';

/// MyComicSearchPage : search page
class TheaterListPage extends StatefulWidget {
  final String area;
  final List<TheaterInfoModel> theaterInfo;

  const TheaterListPage(this.area, this.theaterInfo, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => TheaterListPageState();
}

class TheaterListPageState extends State<TheaterListPage> {
  late Future<List<TheaterInfoModel>> future;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.area),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: widget.theaterInfo.length,
          itemBuilder: (context, index) {
            final item = widget.theaterInfo[index];
            return theater_list_cell_view(item);
          },
        ));
  }
}
