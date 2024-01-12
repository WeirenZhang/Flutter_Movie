import 'package:flutter/material.dart';
import 'package:movie_flutter/component/navigator/app_navigator.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';

class theater_list_cell_view extends StatelessWidget {
  late TheaterInfoModel item;

  theater_list_cell_view(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          AppNavigator.pushMovieTheaterResult(
              context, item);
        },
        child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(item.name,
                        maxLines: 2,
                        style: TextStyle(
                            color: SQColor.a434eae,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
                const SizedBox(height: 5),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(item.adds,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: SQColor.gray,
                        ))),
                const SizedBox(height: 5),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(item.tel,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: SQColor.gray,
                        ))),
              ],
            )));
  }
}
