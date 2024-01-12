import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:movie_flutter/component/ui/widget/loading_container.dart';
import 'package:movie_flutter/component/utils/toast_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'base_change_notifier_model.dart';
import 'package:movie_flutter/component/net/http_manager.dart';
import 'package:sprintf/sprintf.dart';

//分页模型抽取
abstract class PagingListModel<T, M extends PagingModel<T>>
    extends BaseChangeNotifierModel {
  List<T> itemList = []; //集合数组
  int page = 1; //下一页请求链接
  RefreshController refreshController = //上拉加载/下拉刷新控制器
      RefreshController(initialRefresh: false);

  //下拉刷新
  void refresh() {
    page = 1;

    HttpManager.getData(
        sprintf(
            '%s?page=%s&type=%s&tab=%s', [getUrl(), page, 'MovieList', getTab()]),
        success: (body) {
          print(body);
          M model = getModel(body);
          doRefreshDataProcess(model.itemList!);
          if (model.itemList!.isNotEmpty) {
            viewState = ViewState.content;
            page += 1;
          } else {
            viewState = ViewState.nodata;
          }
          refreshController.refreshCompleted();
          refreshController.footerMode?.value = LoadStatus.canLoading;
          doExtraAfterRefresh();
        },
        fail: (e) {
          showError(e.toString());
          refreshController.refreshFailed();
          viewState = ViewState.error;
        },
        complete: () => notifyListeners());
  }

  //加载更多
  Future<void> loadMore() async {
    HttpManager.getData(
        sprintf(
            '%s?page=%s&type=%s&tab=%s', [getUrl(), page, 'MovieList', getTab()]),
        success: (body) {
      M model = getModel(body);
      if (model.itemList?.length == 0) {
        refreshController.loadNoData();
        return;
      }
      doLoadMoreDataProcess(model.itemList!);
      itemList.addAll(model.itemList!);
      refreshController.loadComplete();
      notifyListeners();
      page += 1;
    }, fail: (e) {
      showError(e.toString());
      refreshController.loadFailed();
    });
  }

  //错误重试
  retry() {
    viewState = ViewState.loading;
    notifyListeners();
    refresh();
  }

  void doRefreshDataProcess(List<T> list) {
    itemList = list;
  }

  void doLoadMoreDataProcess(List<T> list) {}

  //下拉刷新后的额外操作
  void doExtraAfterRefresh() {}

  //下拉刷新请求地址
  String getUrl();

  //下拉刷新请求地址
  String getTab();

  //请求返回的真实数据模型
  M getModel(String body);

//请求返回的真实数据模型
//M getModel(Map<String, dynamic> json);
}
