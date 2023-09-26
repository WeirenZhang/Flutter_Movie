import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movieinfo/video_widget.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';

/// MyComicSearchPage : search page
class VideoPage extends StatefulWidget {
  final ReleaseItemModel releaseItem;
  const VideoPage(this.releaseItem, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: VideoWidget(widget.releaseItem));
  }
}
