//import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:movie_flutter/component/cache/cache_manager.dart';
import 'package:movie_flutter/component/net/http_constant.dart';

class AppInitialize {
  AppInitialize._();

  //App初始化工作
  static Future<void> init() async {
    await CacheManager.preInit();
    HttpConstant.baseUrl = 'https://script.google.com/';
    /*
    Future.delayed(
        const Duration(milliseconds: 2000), () => FlutterSplashScreen.hide());
        */
  }
}
