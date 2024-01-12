import 'package:movie_flutter/component/core/viewmodel/base_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:sprintf/sprintf.dart';

class TheaterAreaModel
    extends BaseListModel<TheaterAreaItemModel, TheaterAreaListModel> {
  @override
  String getUrl() {
    return sprintf('%s?type=%s', [
      '${HttpConstant.baseUrl}macros/s/AKfycbwwB2Ke85PFeQqt2P9BRZFOxWif6JI4_ImblPyfFlP-VTJLkJJ6sZkCMD4tPhF_g8yT/exec',
      'Area'
    ]);
  }

  @override
  TheaterAreaListModel getModel(String body) {
    return TheaterAreaListModel.fromParse(body);
  }
}
