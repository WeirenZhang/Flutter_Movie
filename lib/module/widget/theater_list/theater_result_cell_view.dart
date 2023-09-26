import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movie_cover_image.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';
import 'package:movie_flutter/component/navigator/app_navigator.dart';
import 'package:movie_flutter/component/utils/screen.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/module/model/theater_list/theater_result_model.dart';

class theater_result_cell_view extends StatelessWidget {
  late TheaterResultItemModel item;

  theater_result_cell_view(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = Screen.width / 4;
    var height = (width * 17) / 12;
    return InkWell(
      onTap: () {
        AppNavigator.pushMovieInfoTabNavigation(
            context,
            ReleaseItemModel(item.id, item.theaterlist_name, item.release_foto,
                item.en, ''));
      },
      child: Card(
        color: SQColor.lightGray,
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: MovieCoverImage(item.release_foto,
                    width: width, height: height)),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(item.theaterlist_name,
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
                  const SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: (item.icon.isNotEmpty)
                          ? MovieCoverImage(item.icon, width: 45, height: 45)
                          : null),
                  const SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GridView.count(
                        shrinkWrap: true,
                        childAspectRatio: 2.0,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(item.tapbox.length, (index) {
                          return Card(
                              color: SQColor.c840aa,
                              child: Center(
                                  child: Text(item.tapbox[index],
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: SQColor.white))));
                        }),
                      )),
                  const SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: GridView.count(
                        shrinkWrap: true,
                        childAspectRatio: 2.0,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        physics: NeverScrollableScrollPhysics(),
                        children:
                            List.generate(item.theater_time.length, (index) {
                          return Card(
                              child: Center(
                                  child: Text(item.theater_time[index],
                                      style: TextStyle(
                                          fontSize: 16, color: SQColor.gray))));
                        }),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
