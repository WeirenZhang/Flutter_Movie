import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movielist/movie_cell_view.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/component/core/state/base_list_state.dart';
import 'package:movie_flutter/module/viewmodel/movielist/movie_intheaters_model.dart';

/// MyComicSearchPage : search page
class MovieInTheatersWidget extends StatefulWidget {
  const MovieInTheatersWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieInTheatersWidgetState();
}

class MovieInTheatersWidgetState extends PagingListState<ReleaseItemModel,
    MovieInTheatersModel, MovieInTheatersWidget> {
  @override
  Widget getContentChild(MovieInTheatersModel model) => ListView.builder(
      itemBuilder: (context, index) {
        return movie_cell_view(model.itemList[index]);
      },
      itemCount: model.itemList.length);

  @override
  MovieInTheatersModel get viewModel => MovieInTheatersModel();
}
