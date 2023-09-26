import 'dart:convert';
import 'package:movie_flutter/component/core/viewmodel/base_change_notifier_model.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:movie_flutter/component/cache/history_repository.dart';

class MyFavouriteModel extends BaseChangeNotifierModel {
  List<ReleaseItemModel> releaseitemList = [];
  List<TheaterInfoModel> theateritemList = [];
  List<String> releaseList = [];
  List<String> theaterList = [];

  void loadReleaseData() {
    releaseList = HistoryRepository.loadReleaseHistoryData();
    var list = releaseList.map((value) {
      return ReleaseItemModel.fromJson(json.decode(value));
    }).toList();
    releaseitemList = list;
    notifyListeners();
  }

  void loadTheaterData() {
    theaterList = HistoryRepository.loadTheaterHistoryData();
    var list = theaterList.map((value) {
      return TheaterInfoModel.fromJson(json.decode(value));
    }).toList();
    theateritemList = list;
    notifyListeners();
  }

  void removeRelease(int index) {
    releaseList.removeAt(index);
    HistoryRepository.saveReleaseHistoryData(releaseList);
    loadReleaseData();
  }

  void removeTheater(int index) {
    theaterList.removeAt(index);
    HistoryRepository.saveTheaterHistoryData(theaterList);
    loadTheaterData();
  }
}
