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
                      child: getContentChild(model))));
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
  late TabController tabController;
  late PageController pageController;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<M>(
        model: viewModel,
        onModelInit: (model) {
          model.loadData();
        },
        builder: (context, model, child) {
          tabController =
              TabController(length: model.itemList.length, vsync: this);
          pageController = PageController();
          return Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left: 6, right: 6, top: 3),
                  child: ElevatedButton.icon(
                    icon: const Icon(EvilIcons.search),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40), // NEW
                    ),
                    label: Text(model.date!),
                    onPressed: () async {
                      final result = await showDatePicker(
                          context: context,
                          initialDate: DateTime.parse(model.date!),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 9)));
                      if (result != null) {
                        debugPrint("DateTime=$result");
                        DateTime dt = DateTime.parse(result.toString());
                        var formatter = DateFormat('yyyy-MM-dd');
                        model.date = formatter.format(dt);
                        model.retry();
                      }
                    },
                  )),
              Expanded(
                  child: LoadingContainer(
                      viewState: model.viewState,
                      retry: model.retry,
                      child: getContentChild(model)))
            ],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
