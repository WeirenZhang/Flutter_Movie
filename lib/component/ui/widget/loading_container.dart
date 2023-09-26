import 'package:flutter/material.dart';
import 'package:movie_flutter/component/ui/config/color.dart';
import 'package:movie_flutter/component/ui/config/string.dart';

//页面加载的状态
enum ViewState { loading, content, error, nodata }

//多状态视图封装
class LoadingContainer extends StatelessWidget {
  final Widget? child;
  final ViewState? viewState;
  final VoidCallback? retry;

  const LoadingContainer(
      {Key? key,
      @required this.child,
      @required this.retry,
      this.viewState = ViewState.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (viewState == ViewState.loading) {
      return _loadView;
    } else if (viewState == ViewState.error) {
      return _errorView;
    } else if (viewState == ViewState.nodata) {
      return _nodataView;
    } else {
      return child!;
    }
  }

  Widget get _errorView {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('img/ic_error.png', width: 100, height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              net_error_tip,
              style: TextStyle(color: hitTextColor, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: OutlinedButton(
              onPressed: () => retry?.call(),
              child: Text(
                reload_again,
                style: TextStyle(color: Colors.black87),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.all(Colors.black12)),
            ),
          )
        ],
      ),
    );
  }

  Widget get _nodataView {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('img/ic_nodata.png', width: 100, height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              no_data_tip,
              style: TextStyle(color: hitTextColor, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: OutlinedButton(
              onPressed: () => retry?.call(),
              child: Text(
                reload_again,
                style: TextStyle(color: Colors.black87),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.all(Colors.black12)),
            ),
          )
        ],
      ),
    );
  }

  Widget get _loadView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
