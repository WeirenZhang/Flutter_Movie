import 'package:flutter/material.dart';
import 'package:movie_flutter/module/viewmodel/movieinfo/movieinfo_model.dart';
import 'package:movie_flutter/component/core/state/base_list_state.dart';
import 'package:movie_flutter/module/model/movieinfo/movieinfo_model.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/module/widget/movieinfo/movieinfo_cell_view.dart';

/// MyComicSearchPage : search page
class MovieInfoWidget extends StatefulWidget {
  final ReleaseItemModel releaseItem;

  const MovieInfoWidget(this.releaseItem, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieInfoWidgetState();
}

class MovieInfoWidgetState extends BaseListState<MovieInfoItemModel,
    MovieInfoModel, MovieInfoWidget> {
  @override
  Widget getContentChild(MovieInfoModel model) => ListView.builder(
      itemBuilder: (context, index) {
        return movieinfo_cell_view(model.itemList[index]);
      },
      itemCount: model.itemList.length);

  @override
  MovieInfoModel get viewModel => MovieInfoModel(widget.releaseItem);
}
