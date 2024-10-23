import 'package:movie_flutter/component/core/viewmodel/paging_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';

class MovieListModel
    extends PagingListModel<ReleaseItemModel, ReleaseListModel> {
  final String home_id;

  MovieListModel(this.home_id);

  @override
  String getUrl() {
    return '${HttpConstant.baseUrl}macros/s/AKfycbzNPN95_VIeYPTKF85yVS5oml_lUiVL0TUlQvuNj1krEUjUQFtBq_BY6eraap6zW2ZI/exec';
  }

  @override
  String getTab() {
    return home_id;
  }

  @override
  ReleaseListModel getModel(String body) {
    //return ReleaseListModel.fromParse(body);
    return ReleaseListModel.fromJson(body);
  }
}
