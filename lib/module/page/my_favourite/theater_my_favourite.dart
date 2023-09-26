import 'package:flutter/material.dart';
import 'package:movie_flutter/module/viewmodel/my_favourite/my_favourite_model.dart';
import 'package:movie_flutter/component/core/widget/provider_widget.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:movie_flutter/component/navigator/app_navigator.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';

/// MyComicSearchPage : search page
class TheaterMyFavouritePage extends StatefulWidget {
  const TheaterMyFavouritePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TheaterMyFavouritePageState();
}

class TheaterMyFavouritePageState extends State<TheaterMyFavouritePage> {
  Widget build(BuildContext context) {
    return ProviderWidget<MyFavouriteModel>(
        model: MyFavouriteModel(),
        onModelInit: (model) {
          model.loadTheaterData();
        },
        builder: (context, model, child) {
          // 弹出对话框
          Future<bool?> showDeleteConfirmDialog(String str) {
            return showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("提示"),
                  content: Text("您確定要刪除 $str 嗎?"),
                  actions: <Widget>[
                    TextButton(
                      child: const Text("取消"),
                      onPressed: () => Navigator.of(context).pop(), // 关闭对话框
                    ),
                    TextButton(
                      child: const Text("删除"),
                      onPressed: () {
                        //关闭对话框并返回true
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              },
            );
          }

          return Stack(children: <Widget>[
            Offstage(
                offstage: model.theateritemList == null ||
                    model.theateritemList.isEmpty,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      final item = model.theateritemList[index];
                      return InkWell(
                          onTap: () {
                            AppNavigator.pushMovieTheaterResult(context, item);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 17,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(item.name,
                                                    style: TextStyle(
                                                        color: SQColor.a434eae,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            const SizedBox(height: 5),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(item.adds,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: SQColor.gray,
                                                    ))),
                                            const SizedBox(height: 5),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(item.tel,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: SQColor.gray,
                                                    ))),
                                          ],
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: IconButton(
                                        icon: const Icon(AntDesign.delete),
                                        onPressed: () async {
                                          //弹出对话框并等待其关闭
                                          bool? delete =
                                              await showDeleteConfirmDialog(
                                                  item.name);
                                          if (delete == null) {
                                            print("取消删除");
                                          } else {
                                            print("已确认删除");
                                            //... 删除文件
                                            model.removeTheater(index);
                                          }
                                        },
                                      ),
                                    )
                                  ])));
                    },
                    itemCount: model.theateritemList.length)),
            Offstage(
                //控制控件显示或隐藏
                offstage: model.theateritemList != null &&
                    model.theateritemList.isNotEmpty,
                child: Center(
                  child: Image.asset('img/ic_nodata.png'),
                ))
          ]);
        });
  }
}
