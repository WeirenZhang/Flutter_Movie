import 'dart:convert';
import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:html/parser.dart';
import 'package:movie_flutter/component/utils/utils.dart';

class MovieDateTabItemModel {
  late String date;
  late List<MovieTimeTabItemModel> list;

  MovieDateTabItemModel(
    this.date,
    this.list,
  );

  MovieDateTabItemModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['list'] != null) {
      list = [];
      (json['list'] as List).forEach((v) {
        list.add(MovieTimeTabItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class MovieTimeTabItemModel {
  late String area;
  late List<MovieTimeResult> data;

  MovieTimeTabItemModel(
    this.area,
    this.data,
  );

  MovieTimeTabItemModel.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    if (json['data'] != null) {
      data = [];
      (json['data'] as List).forEach((v) {
        data.add(MovieTimeResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class MovieTimeResult {
  late String id;
  late String theater;
  late List<Types> types;

  MovieTimeResult(
    this.id,
    this.theater,
    this.types,
  );

  MovieTimeResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    theater = json['theater'];
    if (json['types'] != null) {
      types = [];
      (json['types'] as List).forEach((v) {
        types.add(Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Types {
  late List<Type> types;
  late List<Time> times;

  Types(
    this.types,
    this.times,
  );

  Types.fromJson(Map<String, dynamic> json) {
    if (json['types'] != null) {
      types = [];
      (json['types'] as List).forEach((v) {
        types.add(Type.fromJson(v));
      });
    }
    if (json['times'] != null) {
      times = [];
      (json['times'] as List).forEach((v) {
        times.add(Time.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Type {
  late String type;

  Type(
    this.type,
  );

  Type.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Time {
  late String time;

  Time(
    this.time,
  );

  Time.fromJson(Map<String, dynamic> json) {
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class MovieTimeTabListModel extends PagingModel<MovieDateTabItemModel> {
  MovieTimeTabListModel.fromParse(String body) {
    List<dynamic> list = json.decode(body);
    itemList = [];
    list.forEach((v) {
      itemList?.add(MovieDateTabItemModel.fromJson(v));
    });
    /*
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
     */
  }
}
