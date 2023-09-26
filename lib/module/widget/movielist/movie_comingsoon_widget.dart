import 'package:flutter/material.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/component/core/state/base_list_state.dart';
import 'package:movie_flutter/module/viewmodel/movielist/movie_comingsoon_model.dart';
import 'package:movie_flutter/module/widget/movielist/movie_cell_view.dart';

/// MyComicSearchPage : search page
class MovieComingSoonWidget extends StatefulWidget {
  const MovieComingSoonWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieComingSoonWidgetState();
}

class MovieComingSoonWidgetState extends PagingListState<ReleaseItemModel,
    MovieComingSoonModel, MovieComingSoonWidget> {
  @override
  Widget getContentChild(MovieComingSoonModel model) => ListView.builder(
      itemBuilder: (context, index) {
        return movie_cell_view(model.itemList[index]);
      },
      itemCount: model.itemList.length);

  @override
  MovieComingSoonModel get viewModel => MovieComingSoonModel();
}
