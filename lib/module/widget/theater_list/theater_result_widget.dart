import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:movie_flutter/module/model/theater_list/theater_result_model.dart';
import 'package:movie_flutter/component/core/state/base_list_state.dart';
import 'package:movie_flutter/module/viewmodel/theater_list/theater_result_model.dart';
import 'package:movie_flutter/module/model/theater_list/theater_area_model.dart';
import 'package:movie_flutter/module/widget/theater_list/theater_result_cell_view.dart';

/// MyComicSearchPage : search page
class TheaterResultWidget extends StatefulWidget {
  final TheaterInfoModel theaterInfo;

  const TheaterResultWidget(this.theaterInfo, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TheaterResultWidgetState();
}

class TheaterResultWidgetState extends BaseListState<TheaterDateItemModel,
    TheaterResultModel, TheaterResultWidget> {
  @override
  Widget getContentChild(TheaterResultModel model) => Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 6, right: 6, top: 3),
              child: ElevatedButton.icon(
                icon: const Icon(EvilIcons.search),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40), // NEW
                ),
                label: Text(model.itemList.elementAt(model.index).date),
                onPressed: () async {
                  int? index = await showDialog<int>(
                    context: context,
                    builder: (BuildContext context) {
                      var child = Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(title: Text("選擇日期")),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.itemList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title:
                                    Text(model.itemList.elementAt(index).date),
                                onTap: () => Navigator.of(context).pop(index),
                              );
                            },
                          ),
                        ],
                      );
                      //使用AlertDialog会报错
                      //return AlertDialog(content: child);
                      return Dialog(child: child);
                    },
                  );
                  if (index != null) {
                    model.index = index;
                    model.select();
                  }
                },
              )),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = model.itemList[model.index].data[index];
                  return theater_result_cell_view(item);
                },
                itemCount: model.itemList.elementAt(model.index).data.length),
          )
        ],
      );

  @override
  TheaterResultModel get viewModel => TheaterResultModel(widget.theaterInfo);
}
