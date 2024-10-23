import 'package:flutter/material.dart';
import 'package:movie_flutter/module/model/menu_info_model.dart';
import 'package:movie_flutter/component/utils/sq_color.dart';
import '../../component/navigator/app_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<MenuInfoModel> infos = <MenuInfoModel>[];
    MenuInfoModel menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_2.png";
    menuInfo.title = "本周新片";
    menuInfo.home_id = "0";
    infos.add(menuInfo);
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_1.png";
    menuInfo.title = "本期首輪";
    menuInfo.home_id = "1";
    infos.add(menuInfo);
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_1.png";
    menuInfo.title = "本期二輪";
    menuInfo.home_id = "2";
    infos.add(menuInfo);
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_4.png";
    menuInfo.title = "近期上映";
    menuInfo.home_id = "3";
    infos.add(menuInfo);
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_4.png";
    menuInfo.title = "新片快報";
    menuInfo.home_id = "4";
    infos.add(menuInfo);
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_5.png";
    menuInfo.title = "電影院";
    menuInfo.home_id = "5";
    infos.add(menuInfo);
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_3.png";
    menuInfo.title = "我的最愛";
    menuInfo.home_id = "6";
    infos.add(menuInfo);
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_6.png";
    menuInfo.title = "網路訂票";
    menuInfo.home_id = "7";
    infos.add(menuInfo);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('電影時刻表'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
        children: List.generate(infos.length, (index) {
          return InkWell(
              onTap: () {
                if (infos[index].home_id.contains("0")) {
                  AppNavigator.pushMovieList(context, "0", infos[index].title);
                }
                if (infos[index].home_id.contains("1")) {
                  AppNavigator.pushMovieList(context, "1", infos[index].title);
                }
                if (infos[index].home_id.contains("2")) {
                  AppNavigator.pushMovieList(context, "2", infos[index].title);
                }
                if (infos[index].home_id.contains("3")) {
                  AppNavigator.pushMovieList(context, "3", infos[index].title);
                }
                if (infos[index].home_id.contains("4")) {
                  AppNavigator.pushMovieList(context, "4", infos[index].title);
                }
                if (infos[index].home_id.contains("5")) {
                  AppNavigator.pushAreaList(context);
                }
                if (infos[index].home_id.contains("6")) {
                  AppNavigator.pushMyFavourite(context);
                }
                if (infos[index].home_id.contains("7")) {
                  AppNavigator.pushWebView(
                      context,
                      'https://www.ezding.com.tw/faq?comeFromApp=true&device=app',
                      '網路訂票');
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ClipRRect(child: Image.asset(infos[index].icon)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    infos[index].title,
                    style: TextStyle(fontSize: 16, color: SQColor.gray),
                    textAlign: TextAlign.center,
                  ),
                ],
              ));
        }),
      ),
    );
  }
}
