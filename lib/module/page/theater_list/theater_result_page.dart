import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:movie_flutter/module/widget/theater_list/theater_result_widget.dart';
import 'package:movie_flutter/component/cache/history_repository.dart';

/// MyComicSearchPage : search page
class TheaterResultPage extends StatefulWidget {
  final TheaterInfoModel theaterInfo;

  const TheaterResultPage(this.theaterInfo, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TheaterResultPageState();
}

class TheaterResultPageState extends State<TheaterResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.theaterInfo.name),
          centerTitle: true,
          actions: <Widget>[
            // 非隐藏的菜单
            IconButton(
                icon: const Icon(MaterialCommunityIcons.heart_outline),
                tooltip: 'Add Alarm',
                onPressed: () async {
                  final snackBar = SnackBar(
                    content: Text("${widget.theaterInfo.name} 已加入我的最愛"),
                    action: SnackBarAction(
                      label: '知道了',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  if (await HistoryRepository.saveTheaterHistory(
                      widget.theaterInfo)) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }),
          ],
        ),
        body: TheaterResultWidget(widget.theaterInfo));
  }
}
