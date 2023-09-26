import 'package:intl/intl.dart';
import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:movie_flutter/component/ui/widget/loading_container.dart';
import 'package:movie_flutter/component/utils/toast_util.dart';
import 'base_change_notifier_model.dart';
import 'package:movie_flutter/component/net/http_manager.dart';

abstract class TabListModel<T, M extends PagingModel<T>>
    extends BaseChangeNotifierModel {
  List<T> itemList = []; //集合数组

  void loadData() async {
    HttpManager.getData(getUrl(),
        success: (body) {
          M model = getModel(body);
          itemList = model.itemList!;
          if (itemList.isNotEmpty) {
            viewState = ViewState.content;
          } else {
            viewState = ViewState.nodata;
          }
        },
        fail: (e) {
          showError(e.toString());
          viewState = ViewState.error;
        },
        complete: () => notifyListeners());
  }

  retry() {
    viewState = ViewState.loading;
    notifyListeners();
    loadData();
  }

  //下拉刷新请求地址
  String getUrl();

  String? date;

  //请求返回的真实数据模型
  M getModel(String body);
}
