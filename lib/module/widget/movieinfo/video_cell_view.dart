import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movie_cover_image.dart';
import 'package:movie_flutter/module/model/movieinfo/video_model.dart';
import 'package:movie_flutter/component/navigator/app_navigator.dart';
import 'package:movie_flutter/component/utils/screen.dart';

class video_cell_view extends StatelessWidget {
  late VideoItemModel item;

  video_cell_view(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = Screen.width / 4;
    var height = (width * 65) / 83;
    return InkWell(
      onTap: () {
        AppNavigator.pushWebView(context, item.href, item.title);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: height,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            MovieCoverImage(item.cover, width: width, height: height),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(item.title,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
