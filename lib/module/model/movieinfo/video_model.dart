import 'dart:convert';

import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:html/parser.dart';
import 'package:movie_flutter/component/utils/utils.dart';

class VideoItemModel {
  late String title;

  late String href;

  late String cover;

  VideoItemModel(
    this.title,
    this.href,
    this.cover,
  );

  VideoItemModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    href = json['href'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class VideoListModel extends PagingModel<VideoItemModel> {
  VideoListModel.fromParse(String body) {
    List<dynamic> list = json.decode(body);
    itemList = [];
    list.forEach((v) {
      itemList?.add(VideoItemModel.fromJson(v));
    });
    /*
    var doc = parse(body);
    itemList = [];
    doc.querySelectorAll(".have_arbox").forEach((e) {
      var check = e.querySelector(".title")?.text ?? "";
      if (check.contains('預告')) {
        e.querySelectorAll("ul.trailer_list > li").forEach((element) {
          var title = element.querySelector("h2.text_truncate_2")?.text ?? "";
          print(title);
          var href = element.querySelector("a")?.attributes["href"] ?? "";
          print(href);
          var cover =
              element.querySelector("div.foto > img")?.attributes["data-src"] ??
                  "";
          print(cover);
          itemList?.add(VideoItemModel(title, href, cover));
        });
      }
    });
     */
  }
}
