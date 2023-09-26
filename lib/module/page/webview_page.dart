import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//展示网页数据
// ignore: must_be_immutable
class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  const WebViewPage(this.url, this.title, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
        centerTitle: true,
        bottom: PreferredSize(
          child: _progressBar(lineProgress, context),
          preferredSize: const Size.fromHeight(3.0),
        ),
      ),
      url: widget.url,
    );
  }

  _progressBar(double progress, BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.white70.withOpacity(0),
      value: progress == 1.0 ? 0 : progress,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }

  FlutterWebviewPlugin flutterWebViewPlugin = FlutterWebviewPlugin();

  double lineProgress = 0.0;

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onProgressChanged.listen((progress) {
      print(progress);
      setState(() {
        lineProgress = progress;
      });
    });
  }

  @override
  void dispose() {
    flutterWebViewPlugin.dispose();
    super.dispose();
  }
}
