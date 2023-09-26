import 'package:movie_flutter/component/core/viewmodel/base_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/movieinfo/movieinfo_model.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';

class MovieInfoModel
    extends BaseListModel<MovieInfoItemModel, MovieInfoListModel> {
  late ReleaseItemModel releaseItem;

  MovieInfoModel(this.releaseItem);

  @override
  String getUrl() {
    return '${HttpConstant.baseUrl}movieinfo_main/${releaseItem.id}';
  }

  @override
  MovieInfoListModel getModel(String body) {
    return MovieInfoListModel.fromParse(body);
  }
}
