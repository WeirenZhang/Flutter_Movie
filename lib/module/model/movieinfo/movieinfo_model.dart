import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:html/parser.dart';
import 'package:movie_flutter/component/utils/utils.dart';

class MovieInfoItemModel {
  late String h1;

  late String h3;

  late String movie_intro_foto;

  late String icon;

  late String level_name_box;

  late String release_movie_time;

  late String length;

  late String director;

  late String actor;

  MovieInfoItemModel(
    this.h1,
    this.h3,
    this.movie_intro_foto,
    this.icon,
    this.level_name_box,
    this.release_movie_time,
    this.length,
    this.director,
    this.actor,
  );
}

class MovieInfoListModel extends PagingModel<MovieInfoItemModel> {
  MovieInfoListModel.fromParse(String body) {
    var doc = parse(body);

    itemList = [];
    var h1 = doc.querySelector("div.movie_intro_info_r > h1")?.text ?? "";
    print(h1);
    var h3 = doc.querySelector("div.movie_intro_info_r > h3")?.text ?? "";
    print(h3);
    var movie_intro_foto =
        doc.querySelector("div.movie_intro_foto > img")?.attributes["src"] ??
            "";
    print(movie_intro_foto);
    var icon = doc
            .querySelector("div.movie_intro_info_r > div[class^='icon']")
            ?.attributes["class"] ??
        "";
    icon.isNotEmpty ? icon = "https://s.yimg.com/cv/ae/movies/$icon.png" : null;
    print(icon);
    var level_name_box =
        trimAllLF1(doc.querySelector("div.level_name_box")?.text ?? "");
    print(level_name_box);

    var release_movie_time = '';
    var length = '';
    int num = 0;
    doc.querySelectorAll("div.movie_intro_info_r > span").forEach((e) {
      if (num == 0) {
        release_movie_time = e.text;
        print(release_movie_time);
      } else if (num == 1) {
        length = e.text;
        print(length);
      }
      num += 1;
    });
    var director = '';
    var actor = '';
    num = 0;
    doc.querySelectorAll("span.movie_intro_list").forEach((e) {
      if (num == 0) {
        director = trimAllLF(e.text);
        print(director);
      } else if (num == 1) {
        actor = trimAllLF(e.text);
        print(actor);
      }
      num += 1;
    });
    itemList?.add(MovieInfoItemModel(h1, h3, movie_intro_foto, icon,
        level_name_box, release_movie_time, length, director, actor));
  }
}
