import 'package:flutter/material.dart';
import 'package:movie_flutter/module/widget/movieinfo/storeinfo_widget.dart';
import 'package:movie_flutter/module/model/movielist/release_list_model.dart';

/// MyComicSearchPage : search page
class StoreInfoPage extends StatefulWidget {
  final ReleaseItemModel releaseItem;
  const StoreInfoPage(this.releaseItem, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StoreInfoPageState();
}

class StoreInfoPageState extends State<StoreInfoPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoreInfoWidget(widget.releaseItem));
  }
}
