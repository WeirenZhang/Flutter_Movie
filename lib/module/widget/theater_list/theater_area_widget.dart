import 'package:flutter/material.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:movie_flutter/component/core/state/base_list_state.dart';
import 'package:movie_flutter/module/viewmodel/theater_list/theater_area_model.dart';
import 'package:movie_flutter/component/navigator/app_navigator.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';

/// MyComicSearchPage : search page
class TheaterAreaWidget extends StatefulWidget {
  const TheaterAreaWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TheaterAreaWidgetState();
}

class TheaterAreaWidgetState extends BaseListState<TheaterAreaItemModel,
    TheaterAreaModel, TheaterAreaWidget> {
  @override
  Widget getContentChild(TheaterAreaModel model) => ListView.builder(
      itemBuilder: (context, index) {
        final item = model.itemList[index].theater_top;
        return InkWell(
            onTap: () {
              AppNavigator.pushMovieTheaterlist(
                  context,
                  model.itemList[index].theater_top,
                  model.itemList[index].theater_list_info);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, bottom: 10, right: 10),
              child: Text(item,
                  style: TextStyle(
                      color: SQColor.a434eae,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ));
      },
      itemCount: model.itemList.length);

  @override
  TheaterAreaModel get viewModel => TheaterAreaModel();
}
