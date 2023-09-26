import 'package:movie_flutter/component/core/viewmodel/base_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/movieinfo/video_model.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';

class VideoModel
    extends BaseListModel<VideoItemModel, VideoListModel> {
  late ReleaseItemModel releaseItem;

  VideoModel(this.releaseItem);

  @override
  String getUrl() {
    return '${HttpConstant.baseUrl}movieinfo_main/${releaseItem.id}';
  }

  @override
  VideoListModel getModel(String body) {
    return VideoListModel.fromParse(body);
  }
}
