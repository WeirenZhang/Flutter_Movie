import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:html/parser.dart';
import 'package:movie_flutter/component/utils/utils.dart';

class TheaterAreaItemModel {
  late String data_area;

  late String theater_top;

  late List<TheaterInfoModel> theater_list_info;

  TheaterAreaItemModel(
      this.data_area, this.theater_top, this.theater_list_info);
}

class TheaterInfoModel {
  late String theater_id;

  late String name;

  late String adds;

  late String tel;

  TheaterInfoModel(
    this.theater_id,
    this.name,
    this.adds,
    this.tel,
  );

  TheaterInfoModel.fromJson(Map<String, dynamic> json) {
    theater_id = json['theater_id'];
    name = json['name'];
    adds = json['adds'];
    tel = json['tel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['theater_id'] = theater_id;
    data['name'] = name;
    data['adds'] = adds;
    data['tel'] = tel;
    return data;
  }
}

class TheaterAreaListModel extends PagingModel<TheaterAreaItemModel> {
  TheaterAreaListModel.fromParse(String body) {
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
  }
}
