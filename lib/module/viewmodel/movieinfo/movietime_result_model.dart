import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:movie_flutter/component/core/viewmodel/tab_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/movieinfo/movietime_result_model.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:sprintf/sprintf.dart';

class MovieTimeResultModel
    extends TabListModel<MovieDateTabItemModel, MovieTimeTabListModel> {
  late ReleaseItemModel releaseItem;

  MovieTimeResultModel(this.releaseItem);

  @override
  String getUrl() {
    /*
    if (date == null) {
      DateTime now = DateTime.now();
      var formatter = DateFormat('yyyy-MM-dd');
      if (kDebugMode) {
        print("date == null so ${formatter.format(now)}");
      }
      date = formatter.format(now);
    }
    return '${HttpConstant.baseUrl}ajax/pc/get_schedule_by_movie?movie_id=${releaseItem.id}&date=${date}&area_id=&theater_id=&datetime=&movie_type_id=';
    */
    return sprintf('%s?type=%s&movie_id=%s', [
      '${HttpConstant.baseUrl}macros/s/AKfycbzNPN95_VIeYPTKF85yVS5oml_lUiVL0TUlQvuNj1krEUjUQFtBq_BY6eraap6zW2ZI/exec',
      'MovieTime',
      releaseItem.id
    ]);
  }

  @override
  MovieTimeTabListModel getModel(String body) {
    return MovieTimeTabListModel.fromParse(body);
  }
}
