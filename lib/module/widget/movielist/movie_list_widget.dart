import 'package:flutter/material.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/component/core/state/base_list_state.dart';
import 'package:movie_flutter/module/viewmodel/movielist/movie_list_model.dart';
import 'package:movie_flutter/module/widget/movielist/movie_cell_view.dart';

/// MyComicSearchPage : search page
class MovieListWidget extends StatefulWidget {
  final String home_id;

  const MovieListWidget(this.home_id, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieListWidgetState();
}

class MovieListWidgetState extends PagingListState<ReleaseItemModel,
    MovieListModel, MovieListWidget> {
  @override
  Widget getContentChild(MovieListModel model) => ListView.builder(
      itemBuilder: (context, index) {
        return movie_cell_view(model.itemList[index]);
      },
      itemCount: model.itemList.length);

  @override
  MovieListModel get viewModel => MovieListModel(widget.home_id);
}
