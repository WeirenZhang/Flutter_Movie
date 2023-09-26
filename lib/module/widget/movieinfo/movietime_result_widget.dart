import 'package:flutter/material.dart';
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

class MovieTimeResultWidgetState extends TabListState<MovieTimeTabItemModel,
    MovieTimeResultModel, MovieTimeResultWidget> {
  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget getContentChild(MovieTimeResultModel model) => Column(
        children: <Widget>[
          TabBarWidget(
              tabController: tabController,
              tabs: model.itemList.map((MovieTimeTabItemModel tabInfoItem) {
                return Tab(text: tabInfoItem.area);
              }).toList(),
              onTap: (index) => pageController.animateToPage(index,
                  duration: kTabScrollDuration, curve: Curves.ease)),
          Expanded(
              child: PageView(
                  controller: pageController,
                  onPageChanged: (index) => tabController.index = index,
                  children:
                      model.itemList.map((MovieTimeTabItemModel tabInfoItem) {
                    return TheaterTimeResultPage(tabInfoItem.data);
                  }).toList())),
        ],
      );

  @override
  MovieTimeResultModel get viewModel =>
      MovieTimeResultModel(widget.releaseItem);
}
