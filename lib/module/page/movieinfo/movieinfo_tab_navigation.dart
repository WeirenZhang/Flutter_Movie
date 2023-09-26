import 'package:flutter/material.dart';
import 'package:movie_flutter/component/ui/config/string.dart';
import 'package:movie_flutter/component/core/viewmodel/tab_navigation_model.dart';
import 'package:movie_flutter/component/core/widget/provider_widget.dart';
import 'package:movie_flutter/module/page/movieinfo/movieinfo_page.dart';
import 'package:movie_flutter/module/page/movieinfo/storeinfo_page.dart';
import 'package:movie_flutter/module/page/movieinfo/movietime_result_page.dart';
import 'package:movie_flutter/module/page/movieinfo/video_page.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/component/cache/history_repository.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MovieInfoTabNavigation extends StatefulWidget {
  final ReleaseItemModel releaseItem;

  const MovieInfoTabNavigation(this.releaseItem, {Key? key}) : super(key: key);

  @override
  MovieInfoTabNavigationState createState() => MovieInfoTabNavigationState();
}

class MovieInfoTabNavigationState extends State<MovieInfoTabNavigation> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.releaseItem.title),
        centerTitle: true,
        actions: <Widget>[
          // 非隐藏的菜单
          IconButton(
              icon: const Icon(MaterialCommunityIcons.heart_outline),
              tooltip: 'Add Alarm',
              onPressed: () async {
                final snackBar = SnackBar(
                  content: Text("${widget.releaseItem.title} 已加入我的最愛"),
                  action: SnackBarAction(
                    label: '知道了',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                if (await HistoryRepository.saveReleaseHistory(
                    widget.releaseItem)) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          MovieInfoPage(widget.releaseItem),
          StoreInfoPage(widget.releaseItem),
          MovieTimeResultPage(widget.releaseItem),
          VideoPage(widget.releaseItem)
        ],
      ),
      bottomNavigationBar: ProviderWidget<TabNavigationModel>(
          model: TabNavigationModel(),
          onModelInit: (model) {},
          builder: (context, model, child) {
            return BottomNavigationBar(
              currentIndex: model.currentIndex,
              onTap: (index) {
                if (model.currentIndex != index) {
                  _pageController.jumpToPage(index);
                  model.changeBottomTabIndex(index);
                }
              },
              type: BottomNavigationBarType.fixed,
              //显示标题
              items: [
                _bottomItem(
                    DString.movie_information,
                    const Icon(MaterialCommunityIcons.movie_open_star_outline),
                    const Icon(MaterialCommunityIcons.movie_open_star)),
                _bottomItem(
                    DString.synopsis,
                    const Icon(MaterialCommunityIcons.note_text_outline),
                    const Icon(MaterialCommunityIcons.note_text)),
                _bottomItem(
                    DString.play_time,
                    const Icon(Ionicons.md_time_outline),
                    const Icon(Ionicons.md_time)),
                _bottomItem(
                    DString.trailer,
                    const Icon(Ionicons.ios_videocam_outline),
                    const Icon(Ionicons.ios_videocam))
              ],
              selectedItemColor: const Color(0xff000000),
              unselectedItemColor: const Color(0xff9a9a9a),
            );
          }),
    );
  }

  _bottomItem(String title, Icon normalIcon, Icon selectIcon) {
    return BottomNavigationBarItem(
        icon: normalIcon, activeIcon: selectIcon, label: title);
  }
}
