import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movie_cover_image.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/component/navigator/app_navigator.dart';
import 'package:movie_flutter/component/utils/screen.dart';

class movie_cell_view extends StatelessWidget {
  late ReleaseItemModel item;

  movie_cell_view(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = Screen.width / 4;
    var height = (width * 17) / 12;
    return InkWell(
      onTap: () {
        AppNavigator.pushMovieInfoTabNavigation(context, item);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: height,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            MovieCoverImage(item.thumb, width: width, height: height),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(item.title,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 10),
                      Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(item.en,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                color: SQColor.gray,
                              ))),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(item.release_movie_time,
                          style: TextStyle(fontSize: 12, color: SQColor.gray))),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
