import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movie_cover_image.dart';
import 'package:movie_flutter/module/model/movieinfo/movieinfo_model.dart';
import 'package:movie_flutter/component/utils/screen.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';

class movieinfo_cell_view extends StatelessWidget {
  late MovieInfoItemModel item;

  movieinfo_cell_view(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = Screen.width;
    var height = (width * 200) / 147;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieCoverImage(item.movie_intro_foto, width: width, height: height),
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          color: Colors.black,
          child: const Text("電影名稱",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          color: Colors.white,
          child: Text("${item.h1}\n\n${item.h3}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: SQColor.darkGray)),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          color: Colors.black,
          child: const Text("電影分級",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: (item.icon.isNotEmpty)
                ? MovieCoverImage(item.icon, width: 45, height: 45)
                : null),
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          color: Colors.black,
          child: const Text("上映日期",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          color: Colors.white,
          child: Text(item.release_movie_time,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: SQColor.darkGray)),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          color: Colors.black,
          child: const Text("電影長度",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          color: Colors.white,
          child: Text(item.length,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: SQColor.darkGray)),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          color: Colors.black,
          child: const Text("導演",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          color: Colors.white,
          child: Text(item.director,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: SQColor.darkGray)),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          color: Colors.black,
          child: const Text("演員",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: width,
          color: Colors.white,
          child: Text(item.actor,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: SQColor.darkGray)),
        ),
      ],
    );
  }
}
