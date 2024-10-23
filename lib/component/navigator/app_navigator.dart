import 'package:flutter/material.dart';
import 'package:movie_flutter/module/page/movielist/movie_list_page.dart';
import 'package:movie_flutter/module/page/theater_list/theater_area_page.dart';
import 'package:movie_flutter/module/page/my_favourite/my_favourite_tab_navigation.dart';
import 'package:movie_flutter/module/page/webview_page.dart';
import 'package:movie_flutter/module/page/theater_list/theater_list_page.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:movie_flutter/module/page/theater_list/theater_result_page.dart';
import 'package:movie_flutter/module/page/movieinfo/movieinfo_tab_navigation.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';

class AppNavigator {
  static push(BuildContext context, Widget scene) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => scene,
      ),
    );
  }

  static pushMovieList(BuildContext context, String home_id, String title) {
    AppNavigator.push(context, MovieListPage(home_id, title));
  }

  static pushAreaList(BuildContext context) {
    AppNavigator.push(context, const TheaterAreaPage());
  }

  static pushMyFavourite(BuildContext context) {
    AppNavigator.push(context, const MyFavouriteTabNavigation());
  }

  static pushWebView(BuildContext context, String url, String title) {
    AppNavigator.push(context, WebViewPage(url, title));
  }

  static pushMovieTheaterlist(
      BuildContext context, String area, List<TheaterInfoModel> theaterInfo) {
    AppNavigator.push(context, TheaterListPage(area, theaterInfo));
  }

  static pushMovieTheaterResult(
      BuildContext context, TheaterInfoModel theaterInfo) {
    AppNavigator.push(context, TheaterResultPage(theaterInfo));
  }

  static pushMovieInfoTabNavigation(
      BuildContext context, ReleaseItemModel releaseItem) {
    AppNavigator.push(context, MovieInfoTabNavigation(releaseItem));
  }
/*
  static pushLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginScene();
    }));
  }

  static pushWeb(BuildContext context, String url, String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WebScene(url: url, title: title);
    }));
  }

  static pushReader(BuildContext context, int articleId) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ReaderScene(articleId: articleId);
    }));
  }

 */
}
