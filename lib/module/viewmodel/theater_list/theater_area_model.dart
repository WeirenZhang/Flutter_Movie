import 'package:movie_flutter/component/core/viewmodel/base_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';

class TheaterAreaModel
    extends BaseListModel<TheaterAreaItemModel, TheaterAreaListModel> {
  @override
  String getUrl() {
    return '${HttpConstant.baseUrl}theater_list.html';
  }

  @override
  TheaterAreaListModel getModel(String body) {
    return TheaterAreaListModel.fromParse(body);
  }
}
