import 'package:movie_flutter/component/core/viewmodel/base_list_model.dart';
import 'package:movie_flutter/component/net/http_constant.dart';
import 'package:movie_flutter/module/model/movieinfo/storeinfo_model.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';

class StoreInfoModel
    extends BaseListModel<StoreInfoItemModel, StoreInfoListModel> {
  late ReleaseItemModel releaseItem;

  StoreInfoModel(this.releaseItem);

  @override
  String getUrl() {
    return '${HttpConstant.baseUrl}movieinfo_main/${releaseItem.id}';
  }

  @override
  StoreInfoListModel getModel(String body) {
    return StoreInfoListModel.fromParse(body);
  }
}
