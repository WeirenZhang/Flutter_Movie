import 'package:movie_flutter/component/core/viewmodel/base_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/movieinfo/storeinfo_model.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:sprintf/sprintf.dart';

class StoreInfoModel
    extends BaseListModel<StoreInfoItemModel, StoreInfoListModel> {
  late ReleaseItemModel releaseItem;

  StoreInfoModel(this.releaseItem);

  @override
  String getUrl() {
    return sprintf('%s?type=%s&movie_id=%s', [
      '${HttpConstant.baseUrl}macros/s/AKfycbzNPN95_VIeYPTKF85yVS5oml_lUiVL0TUlQvuNj1krEUjUQFtBq_BY6eraap6zW2ZI/exec',
      'StoreInfo',
      releaseItem.id
    ]);
  }

  @override
  StoreInfoListModel getModel(String body) {
    return StoreInfoListModel.fromParse(body);
  }
}
