import 'dart:convert';

import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:html/parser.dart';
import 'package:movie_flutter/component/utils/utils.dart';

class StoreInfoItemModel {
  late String storeInfo;

  StoreInfoItemModel(
    this.storeInfo,
  );

  StoreInfoItemModel.fromJson(Map<String, dynamic> json) {
    storeInfo = json['storeInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class StoreInfoListModel extends PagingModel<StoreInfoItemModel> {
  StoreInfoListModel.fromParse(String body) {
    List<dynamic> list = json.decode(body);
    itemList = [];
    list.forEach((v) {
      itemList?.add(StoreInfoItemModel.fromJson(v));
    });
    /*
    var doc = parse(body);

    itemList = [];
    var storeInfo = trimAllLF2(doc.querySelector("span#story")?.text ?? "");
    print(storeInfo);
    itemList?.add(StoreInfoItemModel(storeInfo));
     */
  }
}
