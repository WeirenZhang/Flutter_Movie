import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_flutter/module/page/home_page.dart';
import 'package:movie_flutter/app_initialize.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(App());
  //Flutter沉浸式状态栏
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: AppInitialize.init(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        var widget = snapshot.connectionState == ConnectionState.done
            ? HomePage()
            : HomePage();
        return GetMaterialAppWidget(
          child: widget,
        );
      },
    );
  }
}

class GetMaterialAppWidget extends StatefulWidget {
  final Widget? child;

  const GetMaterialAppWidget({Key? key, this.child}) : super(key: key);

  @override
  _GetMaterialAppWidgetState createState() => _GetMaterialAppWidgetState();
}

class _GetMaterialAppWidgetState extends State<GetMaterialAppWidget> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Eyepetizer',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => widget.child!),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'TW'),
        Locale('en', 'US'),
      ],
    );
  }
}
