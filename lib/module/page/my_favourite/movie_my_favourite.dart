import 'package:flutter/material.dart';
import 'package:movie_flutter/module/viewmodel/my_favourite/my_favourite_model.dart';
import 'package:movie_flutter/component/core/widget/provider_widget.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:movie_flutter/module/widget/movie_cover_image.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';
import 'package:movie_flutter/component/navigator/app_navigator.dart';
import 'package:movie_flutter/component/utils/screen.dart';

/// MyComicSearchPage : search page
class MovieMyFavouritePage extends StatefulWidget {
  const MovieMyFavouritePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieMyFavouritePageState();
}

class MovieMyFavouritePageState extends State<MovieMyFavouritePage> {
  Widget build(BuildContext context) {
    return ProviderWidget<MyFavouriteModel>(
        model: MyFavouriteModel(),
        onModelInit: (model) {
          model.loadReleaseData();
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
                offstage: model.releaseitemList == null ||
                    model.releaseitemList.isEmpty,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      final item = model.releaseitemList[index];
                      var width = Screen.width / 4;
                      var height = (width * 17) / 12;
                      return InkWell(
                        onTap: () {
                          AppNavigator.pushMovieInfoTabNavigation(
                              context, item);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: height,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MovieCoverImage(item.thumb,
                                      width: width, height: height),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(item.title,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            const SizedBox(height: 10),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(item.en,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: SQColor.gray,
                                                    ))),
                                          ],
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(item.release_movie_time,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: SQColor.gray))),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                        icon: const Icon(AntDesign.delete),
                                        onPressed: () async {
                                          //弹出对话框并等待其关闭
                                          bool? delete =
                                              await showDeleteConfirmDialog(
                                                  item.title);
                                          if (delete == null) {
                                            print("取消删除");
                                          } else {
                                            print("已确认删除");
                                            //... 删除文件
                                            model.removeRelease(index);
                                          }
                                        }),
                                  ),
                                ]),
                          ),
                        ),
                      );
                    },
                    itemCount: model.releaseitemList.length)),
            Offstage(
                //控制控件显示或隐藏
                offstage: model.releaseitemList != null &&
                    model.releaseitemList.isNotEmpty,
                child: Center(
                  child: Image.asset('img/ic_nodata.png'),
                ))
          ]);
        });
  }
}
