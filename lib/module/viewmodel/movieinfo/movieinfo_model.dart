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
      '${HttpConstant.baseUrl}macros/s/AKfycbzNPN95_VIeYPTKF85yVS5oml_lUiVL0TUlQvuNj1krEUjUQFtBq_BY6eraap6zW2ZI/exec',
      'MovieInfo',
      releaseItem.id
    ]);
  }

  @override
  MovieInfoListModel getModel(String body) {
    return MovieInfoListModel.fromParse(body);
  }
}
