import 'package:flutter/material.dart';
import 'package:movie_flutter/component/core/viewmodel/tab_navigation_model.dart';
import 'package:movie_flutter/component/core/widget/provider_widget.dart';
import 'package:movie_flutter/component/ui/config/string.dart';
import 'package:movie_flutter/module/page/my_favourite/movie_my_favourite.dart';
import 'package:movie_flutter/module/page/my_favourite/theater_my_favourite.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

/// MyComicSearchPage : search page
class MyFavouriteTabNavigation extends StatefulWidget {
  const MyFavouriteTabNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFavouriteTabNavigationState();
}

class MyFavouriteTabNavigationState extends State<MyFavouriteTabNavigation> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('我的最愛'),
            centerTitle: true,
          ),
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              MovieMyFavouritePage(),
              TheaterMyFavouritePage(),
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
                    _bottomItem(DString.movie, const Icon(MaterialCommunityIcons.movie_open_star_outline),
                        const Icon(MaterialCommunityIcons.movie_open_star)),
                    _bottomItem(DString.movie_theater, const Icon(Ionicons.film_outline),
                        const Icon(Ionicons.film)),
                  ],
                  selectedItemColor: const Color(0xff000000),
                  unselectedItemColor: const Color(0xff9a9a9a),
                );
              }),
        );
  }

  _bottomItem(String title, Icon normalIcon, Icon selectIcon) {
    return BottomNavigationBarItem(
        icon: normalIcon,
        activeIcon: selectIcon,
        label: title);
  }
}
