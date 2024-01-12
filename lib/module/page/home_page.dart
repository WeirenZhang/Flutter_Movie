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
    menuInfo.icon = "img/enl_1.png";
    menuInfo.title = "現正熱映";
    infos.add(menuInfo);
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_4.png";
    menuInfo.title = "即將上映";
    infos.add(menuInfo);
    /*
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_1.png";
    menuInfo.title = "即將上映";
    infos.add(menuInfo);
    */
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_5.png";
    menuInfo.title = "電影院";
    infos.add(menuInfo);
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_3.png";
    menuInfo.title = "我的最愛";
    infos.add(menuInfo);
    menuInfo = MenuInfoModel();
    menuInfo.icon = "img/enl_2.png";
    menuInfo.title = "網路訂票";
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
        padding: const EdgeInsets.only(top: 30),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
        children: List.generate(infos.length, (index) {
          return InkWell(
              onTap: () {
                if (infos[index].title.contains("現正熱映")) {
                  AppNavigator.pushMovieThisweek(context);
                }
                if (infos[index].title.contains("即將上映")) {
                  AppNavigator.pushMovieIntheaters(context);
                }
                if (infos[index].title.contains("電影院")) {
                  AppNavigator.pushAreaList(context);
                }
                if (infos[index].title.contains("我的最愛")) {
                  AppNavigator.pushMyFavourite(context);
                }
                if (infos[index].title.contains("網路訂票")) {
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
