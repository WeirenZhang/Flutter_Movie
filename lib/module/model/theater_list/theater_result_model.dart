import 'dart:convert';

import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:html/parser.dart';
import 'package:movie_flutter/component/utils/utils.dart';

import '../movieinfo/movietime_result_model.dart';

class TheaterDateItemModel {
  late String date;

  late List<TheaterResultItemModel> data;

  TheaterDateItemModel(this.date, this.data);

  TheaterDateItemModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['data'] != null) {
      data= [];
      (json['data'] as List).forEach((v) {
        data.add(TheaterResultItemModel.fromJson(v));
      });
    }
  }
}

class TheaterResultItemModel {
  late String id;

  late String release_foto;

  late String theaterlist_name;

  late String en;

  late String icon;

  late List<Types> types;

  TheaterResultItemModel(this.id, this.release_foto, this.theaterlist_name,
      this.en, this.icon, this.types);

  TheaterResultItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    release_foto = json['release_foto'];
    theaterlist_name = json['theaterlist_name'];
    en = json['en'];
    icon = json['icon'];
    if (json['types'] != null) {
      types = [];
      (json['types'] as List).forEach((v) {
        types.add(Types.fromJson(v));
      });
    }
  }
}

class TheaterResultListModel extends PagingModel<TheaterDateItemModel> {
  TheaterResultListModel.fromParse(String body) {
    List<dynamic> list = json.decode(body);
    itemList = [];
    list.forEach((v) {
      itemList?.add(TheaterDateItemModel.fromJson(v));
    });
    /*
    var doc = parse(body);

    itemList = [];
    doc.querySelectorAll(".release_list>li").forEach((e) {
      var id = e.querySelector(".release_foto>a")?.attributes["href"] ?? "";
      var ids = id.split("-");
      id = ids[(ids.length) - 1];
      print(id);

      var release_foto =
          e.querySelector(".release_foto>a>img")?.attributes["src"] ?? "";
      release_foto = trimAllLF(release_foto);
      print(release_foto);

      var theaterlist_name = e.querySelector(".theaterlist_name>a")?.text ?? "";
      theaterlist_name = trimAllLF(theaterlist_name);
      print(theaterlist_name);

      var en = e.querySelector(".en>a")?.text ?? "";
      en = trimAllLF(en);
      print(en);

      var children = e.querySelectorAll(".release_info>div");
      var icon = children.isNotEmpty ? children[0].className : "";
      icon.isNotEmpty
          ? icon = "https://s.yimg.com/cv/ae/movies/$icon.png"
          : null;
      print(icon);

      List<String> tapbox = [];
      e.querySelectorAll(".tapbox>div").forEach((element) {
        var tap = trimAllLF(element?.text ?? "");
        if (tap.isNotEmpty) {
          tap = trimAllLF(tap);
          print(tap);
          tapbox.add(tap);
        }
      });

      List<String> theater_time = [];
      e.querySelectorAll(".theater_time>li").forEach((element) {
        var time = trimAllLF(element?.text ?? "");
        if (time.isNotEmpty) {
          time = trimAllLF(time);
          print(time);
          theater_time.add(time);
        }
      });
      itemList?.add(TheaterResultItemModel(
          id, release_foto, theaterlist_name, en, icon, tapbox, theater_time));
    });
    */
  }
}
