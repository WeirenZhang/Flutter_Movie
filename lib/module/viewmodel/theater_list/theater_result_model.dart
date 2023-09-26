import 'package:movie_flutter/component/core/viewmodel/base_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:movie_flutter/module/model/theater_list/theater_result_model.dart';

class TheaterResultModel
    extends BaseListModel<TheaterResultItemModel, TheaterResultListModel> {
  final TheaterInfoModel theaterInfo;

  TheaterResultModel(this.theaterInfo);

  @override
  String getUrl() {
    return '${HttpConstant.baseUrl}theater_result.html/id=${theaterInfo.theater_id}';
  }

  @override
  TheaterResultListModel getModel(String body) {
    return TheaterResultListModel.fromParse(body);
  }
}
