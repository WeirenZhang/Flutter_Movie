import 'dart:convert';

import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:html/parser.dart';
import 'package:movie_flutter/component/utils/utils.dart';

class ReleaseItemModel {
  late String id;

  late String title;

  late String thumb;

  late String en;

  late String release_movie_time;

  ReleaseItemModel(
    this.id,
    this.title,
    this.thumb,
    this.en,
    this.release_movie_time,
  );

  ReleaseItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumb = json['thumb'];
    en = json['en'];
    release_movie_time = json['release_movie_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumb'] = thumb;
    data['en'] = en;
    data['release_movie_time'] = release_movie_time;
    return data;
  }
}

class ReleaseListModel extends PagingModel<ReleaseItemModel> {
  ReleaseListModel.fromJson(String body) {
    List<dynamic> list = json.decode(body);
    itemList = [];
    list.forEach((v) {
      itemList?.add(ReleaseItemModel.fromJson(v));
    });
    /*
  ReleaseListModel.fromParse(String body) {
    var doc = parse(body);

    itemList = [];
    doc.querySelector(".release_list")?.querySelectorAll("li").forEach((e) {
      var title = e.querySelector(".release_movie_name>a")?.text ?? "";
      title = trimAllLF(title);
      print(title);
      var en = e.querySelector(".en>a")?.text ?? "";
      en = trimAllLF(en);
      print(en);
      var thumb =
          e.querySelector(".release_foto>a>img")?.attributes["data-src"] ?? "";
      print(thumb);
      var release_movie_time =
          e.querySelector(".release_movie_time")?.text ?? "";
      release_movie_time = trimAllLF(release_movie_time);
      print(release_movie_time);
      var id = e.querySelector(".release_foto>a")?.attributes["href"] ?? "";
      var ids = id.split("-");
      id = ids[(ids.length) - 1];
      print(id);

      itemList?.add(ReleaseItemModel(id, title, thumb, en, release_movie_time));
    });
    */
  }
}
