import 'dart:convert';

import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:html/parser.dart';
import 'package:movie_flutter/component/utils/utils.dart';

class TheaterAreaItemModel {
  late String theater_top;

  late List<TheaterInfoModel> theater_list;

  TheaterAreaItemModel(this.theater_top, this.theater_list);

  TheaterAreaItemModel.fromJson(Map<String, dynamic> json) {
    theater_top = json['theater_top'];
    if (json['theater_list'] != null) {
      theater_list = [];
      (json['theater_list'] as List).forEach((v) {
        theater_list.add(TheaterInfoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['theater_top'] = theater_top;
    if (this.theater_list != null) {
      data['theater_list'] = this.theater_list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TheaterInfoModel {
  late String id;

  late String name;

  late String adds;

  late String tel;

  TheaterInfoModel(
    this.id,
    this.name,
    this.adds,
    this.tel,
  );

  TheaterInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adds = json['adds'];
    tel = json['tel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['adds'] = adds;
    data['tel'] = tel;
    return data;
  }
}

class TheaterAreaListModel extends PagingModel<TheaterAreaItemModel> {
  TheaterAreaListModel.fromParse(String body) {
    List<dynamic> list = json.decode(body);
    itemList = [];
    list.forEach((v) {
      itemList?.add(TheaterAreaItemModel.fromJson(v));
    });
    /*
    var doc = parse(body);

    itemList = [];
    doc.querySelectorAll(".theater_content").forEach((e) {
      var id = e.attributes["data-area"] ?? "";
      print(id);
      var title = e.querySelector(".theater_top")?.text ?? "";
      title = trimAllLF(title);
      print(title);

      List<TheaterInfoModel> theaterInfo = [];
      (e.querySelector("ul")?.children?..removeAt(0))?.forEach((element) {
        var href = element.querySelector(".name>a")?.attributes["href"] ?? "";
        List<String> ids = href.split("=");
        var id = ids.last;
        print(id);
        var name = element.querySelector(".name>a")?.text ?? "";
        print(name);
        var adds = element.querySelector(".adds")?.text ?? "";
        print(adds);
        var tel = element.querySelector(".tel")?.text ?? "";
        print(tel);
        theaterInfo.add(TheaterInfoModel(id, name, adds, tel));
      });
      itemList?.add(TheaterAreaItemModel(id, title, theaterInfo));
    });
     */
  }
}
