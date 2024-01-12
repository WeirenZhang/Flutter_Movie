import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:movie_flutter/component/core/model/paging_model.dart';
import 'package:movie_flutter/component/core/viewmodel/paging_list_model.dart';
import 'package:movie_flutter/component/core/widget/provider_widget.dart';
import 'package:movie_flutter/component/ui/widget/loading_container.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:movie_flutter/component/core/viewmodel/base_list_model.dart';
import 'package:movie_flutter/component/core/viewmodel/tab_list_model.dart';

//通用分页State封装
abstract class PagingListState<L, M extends PagingListModel<L, PagingModel<L>>,
        T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin {
  M get viewModel; //真实获取数据的仓库

  Widget getContentChild(M model); //真实的分页控件

  bool get enablePullDown => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<M>(
        model: viewModel,
        onModelInit: (model) {
          model.refresh();
        },
        builder: (context, model, child) {
          return LoadingContainer(
              viewState: model.viewState,
              retry: model.retry,
              child: Container(
                  color: Colors.white,
                  child: SmartRefresher(
                      controller: model.refreshController,
                      onRefresh: model.refresh,
                      onLoading: model.loadMore,
                      enablePullUp: true,
                      enablePullDown: enablePullDown,
                      child: getContentChild(model))));
        });
  }

  @override
  bool get wantKeepAlive => true;
}

//通用列表State封装
abstract class BaseListState<L, M extends BaseListModel<L, PagingModel<L>>,
        T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin {
  M get viewModel; //真实获取数据的仓库

  Widget getContentChild(M model); //真实的列表控件

  bool get enablePullDown => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<M>(
        model: viewModel,
        onModelInit: (model) {
          model.refresh();
        },
        builder: (context, model, child) {
          return LoadingContainer(
              viewState: model.viewState,
              retry: model.retry,
              child: Container(
                  color: Colors.white,
                  child: SmartRefresher(
                      controller: model.refreshController,
                      onRefresh: model.refresh,
                      enablePullDown: enablePullDown,
                      child: model.itemList.isNotEmpty
                          ? getContentChild(model)
                          : null)));
        });
  }

  @override
  bool get wantKeepAlive => true;
}

//通用選項卡State封装
abstract class TabListState<L, M extends TabListModel<L, PagingModel<L>>,
        T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  M get viewModel; //真实获取数据的仓库

  Widget getContentChild(M model); //真实的列表控件

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<M>(
        model: viewModel,
        onModelInit: (model) {
          model.loadData();
        },
        builder: (context, model, child) {
          return LoadingContainer(
              viewState: model.viewState,
              retry: model.retry,
              child: model.itemList.isNotEmpty ? getContentChild(model) : null);
        });
  }

  @override
  bool get wantKeepAlive => true;
}
