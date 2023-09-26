import 'package:flutter/material.dart';
import 'package:movie_flutter/module/viewmodel/movieinfo/storeinfo_model.dart';
import 'package:movie_flutter/component/core/state/base_list_state.dart';
import 'package:movie_flutter/module/model/movieinfo/storeinfo_model.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';

/// MyComicSearchPage : search page
class StoreInfoWidget extends StatefulWidget {
  final ReleaseItemModel releaseItem;

  const StoreInfoWidget(this.releaseItem, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StoreInfoWidgetState();
}

class StoreInfoWidgetState
    extends BaseListState<StoreInfoItemModel, StoreInfoModel, StoreInfoWidget> {
  @override
  Widget getContentChild(StoreInfoModel model) => ListView.builder(
      itemBuilder: (context, index) {
        final item = model.itemList[index].storeInfo;
        return Container(
          padding: const EdgeInsets.all(20),
          child:
              Text(item, style: TextStyle(fontSize: 18, color: SQColor.gray)),
        );
      },
      itemCount: model.itemList.length);

  @override
  StoreInfoModel get viewModel => StoreInfoModel(widget.releaseItem);
}
