import 'package:flutter/material.dart';
import 'package:movie_flutter/component/core/state/base_list_state.dart';
import 'package:movie_flutter/module/viewmodel/movieinfo/video_model.dart';
import 'package:movie_flutter/module/model/movieinfo/video_model.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/module/widget/movieinfo/video_cell_view.dart';

/// MyComicSearchPage : search page
class VideoWidget extends StatefulWidget {
  final ReleaseItemModel releaseItem;

  const VideoWidget(this.releaseItem, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => VideoWidgetState();
}

class VideoWidgetState
    extends BaseListState<VideoItemModel, VideoModel, VideoWidget> {
  @override
  Widget getContentChild(VideoModel model) => ListView.builder(
      itemBuilder: (context, index) {
        return video_cell_view(model.itemList[index]);
      },
      itemCount: model.itemList.length);

  @override
  VideoModel get viewModel => VideoModel(widget.releaseItem);
}
