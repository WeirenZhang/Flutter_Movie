import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movielist/movie_cell_view.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/component/core/state/base_list_state.dart';
import 'package:movie_flutter/module/viewmodel/movielist/movie_thisweek_model.dart';

/// MyComicSearchPage : search page
class MovieThisWeekWidget extends StatefulWidget {
  const MovieThisWeekWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieThisWeekWidgetState();
}

class MovieThisWeekWidgetState extends PagingListState<ReleaseItemModel,
    MovieThisWeekModel, MovieThisWeekWidget> {
  @override
  Widget getContentChild(MovieThisWeekModel model) => ListView.builder(
      itemBuilder: (context, index) {
        return movie_cell_view(model.itemList[index]);
      },
      itemCount: model.itemList.length);

  @override
  MovieThisWeekModel get viewModel => MovieThisWeekModel();
}
