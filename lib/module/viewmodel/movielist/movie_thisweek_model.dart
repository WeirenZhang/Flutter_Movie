import 'package:movie_flutter/component/core/viewmodel/paging_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';

class MovieThisWeekModel
    extends PagingListModel<ReleaseItemModel, ReleaseListModel> {
  @override
  String getUrl() {
    return '${HttpConstant.baseUrl}macros/s/AKfycbwwB2Ke85PFeQqt2P9BRZFOxWif6JI4_ImblPyfFlP-VTJLkJJ6sZkCMD4tPhF_g8yT/exec';
  }

  @override
  String getTab() {
    return '0';
  }

  @override
  ReleaseListModel getModel(String body) {
    //return ReleaseListModel.fromParse(body);
    return ReleaseListModel.fromJson(body);
  }
}
