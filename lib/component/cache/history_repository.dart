import 'dart:convert';
import 'package:movie_flutter/component/cache/cache_manager.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';

class HistoryRepository {
  static const String release_history_list_key = "release_history_list";
  static const String theater_history_list_key = "theater_history_list";

  static Future<bool> saveReleaseHistory(ReleaseItemModel data) async {
    List<String> releaseList = loadReleaseHistoryData();

    bool check = false;

    for (var item in releaseList) {
      Map<String, dynamic> user = json.decode(item);
      if (data.id.contains(user['id'])) {
        print("${data.id} = ${user['id']} 有資料了");
        check = true;
        break;
      }
    }

    var jsonParam = data.toJson();
    //var jsonStr = json.encode(jsonParam);
    if (!check) {
      print("沒資料，寫入");
      releaseList.add(json.encode(jsonParam));
      CacheManager.getInstance().set(release_history_list_key, releaseList);
    }

    return check;
  }

  static Future<bool> saveTheaterHistory(TheaterInfoModel data) async {
    List<String> theaterList = loadTheaterHistoryData();

    bool check = false;

    for (var item in theaterList) {
      Map<String, dynamic> user = json.decode(item);
      if (data.id.contains(user['id'])) {
        print("${data.id} = ${user['id']} 有資料了");
        check = true;
        break;
      }
    }

    var jsonParam = data.toJson();
    //var jsonStr = json.encode(jsonParam);
    if (!check) {
      print("沒資料，寫入");
      theaterList.add(json.encode(jsonParam));
      CacheManager.getInstance().set(theater_history_list_key, theaterList);
    }

    return check;
  }

  static List<String> loadReleaseHistoryData() {
    List<dynamic>? originList = CacheManager.getInstance()
        .get<List<dynamic>>(release_history_list_key) as List?;

    List<String> releaseList;

    if (originList == null) {
      releaseList = [];
    } else {
      releaseList = originList.map((e) => e.toString()).toList();
    }
    return releaseList;
  }

  static List<String> loadTheaterHistoryData() {
    List<dynamic>? originList = CacheManager.getInstance()
        .get<List<dynamic>>(theater_history_list_key) as List?;

    List<String> theaterList;

    if (originList == null) {
      theaterList = [];
    } else {
      theaterList = originList.map((e) => e.toString()).toList();
    }
    return theaterList;
  }

  static saveReleaseHistoryData(List<String> HistoryList) {
    CacheManager.getInstance().set(release_history_list_key, HistoryList);
  }

  static saveTheaterHistoryData(List<String> HistoryList) {
    CacheManager.getInstance().set(theater_history_list_key, HistoryList);
  }
}
