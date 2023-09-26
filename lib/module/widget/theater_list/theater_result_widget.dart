import 'package:flutter/material.dart';
import 'package:movie_flutter/module/model/theater_list/theater_result_model.dart';
import 'package:movie_flutter/component/core/state/base_list_state.dart';
import 'package:movie_flutter/module/viewmodel/theater_list/theater_result_model.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:movie_flutter/module/widget/theater_list/theater_result_cell_view.dart';

/// MyComicSearchPage : search page
class TheaterResultWidget extends StatefulWidget {
  final TheaterInfoModel theaterInfo;

  const TheaterResultWidget(this.theaterInfo, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TheaterResultWidgetState();
}

class TheaterResultWidgetState extends BaseListState<TheaterResultItemModel,
    TheaterResultModel, TheaterResultWidget> {
  @override
  Widget getContentChild(TheaterResultModel model) => ListView.builder(
      itemBuilder: (context, index) {
        final item = model.itemList[index];
        return theater_result_cell_view(item);
      },
      itemCount: model.itemList.length);

  @override
  TheaterResultModel get viewModel => TheaterResultModel(widget.theaterInfo);
}
