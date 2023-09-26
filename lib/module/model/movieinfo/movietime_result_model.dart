import 'dart:convert';
import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:html/parser.dart';
import 'package:movie_flutter/component/utils/utils.dart';

class MovieTimeTabItemModel {
  late String id;
  late String area;
  late List<MovieTimeResult> data;

  MovieTimeTabItemModel(
    this.id,
    this.area,
    this.data,
  );
}

class MovieTimeResult {
  late String id;
  late String theater;
  late String tel;
  late List<Types> types;

  MovieTimeResult(
    this.id,
    this.theater,
    this.tel,
    this.types,
  );
}

class Types {
  late List<Type> types;
  late List<Time> times;

  Types(
    this.types,
    this.times,
  );
}

class Type {
  late String type;

  Type(
    this.type,
  );
}

class Time {
  late String time;

  Time(
    this.time,
  );
}

class MovieTimeTabListModel extends PagingModel<MovieTimeTabItemModel> {
  MovieTimeTabListModel.fromParse(String body) {
    Map<String, dynamic> user = jsonDecode(body);
    var doc = parse(user['view']);
    print(user['view']);

    int num = 0;
    itemList = [];
    doc.querySelectorAll("div.area_timebox").forEach((e) {
      var area_title = e.querySelector("div.area_title");
      var area = area_title?.text ?? "";
      print(area);
      List<MovieTimeResult> movieTimeResult = [];
      e.querySelectorAll("ul").forEach((e1) {
        var id = e1.querySelector("li.adds > a")?.attributes["href"] ?? "";
        List<String> l1 = id.split('=');
        id = l1[l1.length - 1];
        print(id);
        var theater = e1.querySelector("li.adds > a")?.text ?? "";
        print(theater);

        var tel = e1.querySelector("li.adds > span")?.text ?? "";
        print(tel);

        List<Types> types = [];
        e1.querySelectorAll("li.taps").forEach((e2) {
          List<Type> _types = [];
          List<Time> _times = [];

          e2.querySelectorAll("span").forEach((e3) {
            var type = trimAllLF(e3?.text ?? "");
            if (type.isNotEmpty) {
              print(type);
              _types.add(Type(type));
            }
          });

          e2.nextElementSibling?.querySelectorAll("label").forEach((e4) {
            var time = trimAllLF(e4?.text ?? "");
            if (time.isNotEmpty) {
              print(time);
              _times.add(Time(time));
            }
          });
          types.add(Types(_types, _times));
        });
        movieTimeResult.add(MovieTimeResult(id, theater, tel, types));
      });
      itemList
          ?.add(MovieTimeTabItemModel(num.toString(), area, movieTimeResult));
      num++;
    });
  }
}
