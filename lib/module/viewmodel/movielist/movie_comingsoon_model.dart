import 'package:movie_flutter/component/core/viewmodel/paging_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';

class MovieComingSoonModel
    extends PagingListModel<ReleaseItemModel, ReleaseListModel> {
  @override
  String getUrl() {
    return '${HttpConstant.baseUrl}movie_comingsoon.html';
  }

  @override
  ReleaseListModel getModel(String body) {
    return ReleaseListModel.fromParse(body);
  }
}
