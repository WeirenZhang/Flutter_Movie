import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:movie_flutter/component/ui/widget/loading_container.dart';
import 'package:movie_flutter/component/utils/toast_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'base_change_notifier_model.dart';
import 'package:movie_flutter/component/net/http_manager.dart';

//列表模型抽取
abstract class BaseListModel<T, M extends PagingModel<T>>
    extends BaseChangeNotifierModel {
  List<T> itemList = []; //集合数组
  RefreshController refreshController = //上拉加载/下拉刷新控制器
      RefreshController(initialRefresh: false);

  //下拉刷新
  void refresh() {
    HttpManager.getData(getUrl(),
        success: (body) {
          print(body);
          M model = getModel(body);
          doRefreshDataProcess(model.itemList!);
          if (model.itemList!.isNotEmpty) {
            viewState = ViewState.content;
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

  //错误重试
  retry() {
    viewState = ViewState.loading;
    notifyListeners();
    refresh();
  }

  select() {
    notifyListeners();
  }

  void doRefreshDataProcess(List<T> list) {
    itemList = list;
  }

  //下拉刷新后的额外操作
  void doExtraAfterRefresh() {}

  //下拉刷新请求地址
  String getUrl();

  int index = 0;

  //请求返回的真实数据模型
  M getModel(String body);
}
