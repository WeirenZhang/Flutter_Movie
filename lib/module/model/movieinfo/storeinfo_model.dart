import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:html/parser.dart';
import 'package:movie_flutter/component/utils/utils.dart';

class StoreInfoItemModel {
  late String storeInfo;

  StoreInfoItemModel(
    this.storeInfo,
  );
}

class StoreInfoListModel extends PagingModel<StoreInfoItemModel> {
  StoreInfoListModel.fromParse(String body) {
    var doc = parse(body);

    itemList = [];
    var storeInfo = trimAllLF2(doc.querySelector("span#story")?.text ?? "");
    print(storeInfo);
    itemList?.add(StoreInfoItemModel(storeInfo));
  }
}
