import 'package:flutter/material.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';
import 'package:movie_flutter/module/model/movieinfo/movietime_result_model.dart';
import 'package:movie_flutter/component/navigator/app_navigator.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class theatertime_result_cell_view extends StatelessWidget {
  late MovieTimeResult item;

  theatertime_result_cell_view(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          AppNavigator.pushMovieTheaterResult(
              context, TheaterInfoModel(item.id, item.theater, "", ""));
        },
        child: Card(
            color: SQColor.lightGray,
            margin: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(item.theater,
                      style: TextStyle(
                          fontSize: 16,
                          color: SQColor.a434eae,
                          fontWeight: FontWeight.bold))),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: item.types.length,
                itemBuilder: (context, index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: StaggeredGrid.count(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              children: List.generate(
                                  item.types[index].types.length, (index1) {
                                return Card(
                                    color: SQColor.c840aa,
                                    child: Center(
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                bottom: 8),
                                            child: Text(
                                                item.types[index].types[index1]
                                                    .type,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: SQColor.white)))));
                              }),
                            )),
                        Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: StaggeredGrid.count(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              children: List.generate(
                                  item.types[index].times.length, (index1) {
                                return Card(
                                    child: Center(
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                bottom: 8),
                                            child: Text(
                                                item.types[index].times[index1]
                                                    .time,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color:
                                                        SQColor.darkGray)))));
                              }),
                            ))
                      ]);
                },
              ),
            ])));
  }
}
