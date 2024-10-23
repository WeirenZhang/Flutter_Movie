import 'package:movie_flutter/component/core/viewmodel/base_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:sprintf/sprintf.dart';

class TheaterAreaModel
    extends BaseListModel<TheaterAreaItemModel, TheaterAreaListModel> {
  @override
  String getUrl() {
    return sprintf('%s?type=%s', [
      '${HttpConstant.baseUrl}macros/s/AKfycbzNPN95_VIeYPTKF85yVS5oml_lUiVL0TUlQvuNj1krEUjUQFtBq_BY6eraap6zW2ZI/exec',
      'Area'
    ]);
  }

  @override
  TheaterAreaListModel getModel(String body) {
    return TheaterAreaListModel.fromParse(body);
  }
}
