import 'package:movie_flutter/component/core/viewmodel/base_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/movieinfo/movieinfo_model.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:sprintf/sprintf.dart';

class MovieInfoModel
    extends BaseListModel<MovieInfoItemModel, MovieInfoListModel> {
  late ReleaseItemModel releaseItem;

  MovieInfoModel(this.releaseItem);

  @override
  String getUrl() {
    return sprintf('%s?type=%s&movie_id=%s', [
      '${HttpConstant.baseUrl}macros/s/AKfycbwwB2Ke85PFeQqt2P9BRZFOxWif6JI4_ImblPyfFlP-VTJLkJJ6sZkCMD4tPhF_g8yT/exec',
      'MovieInfo',
      releaseItem.id
    ]);
  }

  @override
  MovieInfoListModel getModel(String body) {
    return MovieInfoListModel.fromParse(body);
  }
}
