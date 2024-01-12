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
      '${HttpConstant.baseUrl}macros/s/AKfycbwwB2Ke85PFeQqt2P9BRZFOxWif6JI4_ImblPyfFlP-VTJLkJJ6sZkCMD4tPhF_g8yT/exec',
      'StoreInfo',
      releaseItem.id
    ]);
  }

  @override
  StoreInfoListModel getModel(String body) {
    return StoreInfoListModel.fromParse(body);
  }
}
