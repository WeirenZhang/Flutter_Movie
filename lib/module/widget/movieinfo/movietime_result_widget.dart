import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_flutter/component/core/state/base_list_state.dart';
import 'package:movie_flutter/module/viewmodel/movieinfo/movietime_result_model.dart';
import 'package:movie_flutter/module/model/movieinfo/movietime_result_model.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/component/ui/widget/tab_bar_widget.dart';
import 'package:movie_flutter/module/page/movieinfo/theatertime_result_page.dart';

/// MyComicSearchPage : search page
class MovieTimeResultWidget extends StatefulWidget {
  final ReleaseItemModel releaseItem;

  const MovieTimeResultWidget(this.releaseItem, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieTimeResultWidgetState();
}

class MovieTimeResultWidgetState extends TabListState<MovieDateTabItemModel,
    MovieTimeResultModel, MovieTimeResultWidget> {
  late TabController tabController;
  late PageController pageController;

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget getContentChild(MovieTimeResultModel model) => Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 6, right: 6, top: 3),
              child: ElevatedButton.icon(
                icon: const Icon(EvilIcons.search),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40), // NEW
                ),
                label: Text(model.itemList.elementAt(model.index).date),
                onPressed: () async {
                  int? index = await showDialog<int>(
                    context: context,
                    builder: (BuildContext context) {
                      var child = Column(
                        children: <Widget>[
                          const ListTile(title: Text("選擇日期")),
                          Expanded(
                              child: ListView.builder(
                            itemCount: model.itemList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title:
                                    Text(model.itemList.elementAt(index).date),
                                onTap: () => Navigator.of(context).pop(index),
                              );
                            },
                          )),
                        ],
                      );
                      //使用AlertDialog会报错
                      //return AlertDialog(content: child);
                      return Dialog(child: child);
                    },
                  );
                  if (index != null) {
                    model.index = index;
                    model.select();
                  }
                  /*
                      final result = await showDatePicker(
                          context: context,
                          initialDate: DateTime.parse(model.date!),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 9)));
                      if (result != null) {
                        debugPrint("DateTime=$result");
                        DateTime dt = DateTime.parse(result.toString());
                        var formatter = DateFormat('yyyy-MM-dd');
                        model.date = formatter.format(dt);
                        model.retry();
                      }
                      */
                },
              )),
          TabBarWidget(
              tabController: tabController = TabController(
                  length: model.itemList.elementAt(model.index).list.length,
                  vsync: this),
              tabs: model.itemList
                  .elementAt(model.index)
                  .list
                  .map((MovieTimeTabItemModel tabInfoItem) {
                return Tab(text: tabInfoItem.area);
              }).toList(),
              onTap: (index) => pageController.animateToPage(index,
                  duration: kTabScrollDuration, curve: Curves.ease)),
          Expanded(
              child: PageView(
                  controller: pageController = PageController(),
                  onPageChanged: (index) => tabController.index = index,
                  children: model.itemList
                      .elementAt(model.index)
                      .list
                      .map((MovieTimeTabItemModel tabInfoItem) {
                    return TheaterTimeResultPage(tabInfoItem.data);
                  }).toList())),
        ],
      );

  @override
  MovieTimeResultModel get viewModel =>
      MovieTimeResultModel(widget.releaseItem);
}
