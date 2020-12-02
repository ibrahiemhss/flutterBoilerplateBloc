import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/loading_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SeeMoreWidget extends StatelessWidget {
  final LoadStatus loadStatus;
  final bool outOfScreen;
  final bool isLoadedLisData;

  SeeMoreWidget(
      {Key key,
      @required this.loadStatus,
      @required this.isLoadedLisData,
      @required this.outOfScreen})
      : super(key: key);
//==============================================================================
//==============================================================================

  @override
  Widget build(BuildContext context) {
    return _contentWidget(context);
  }

//==============================================================================
//==============================================================================

  Widget _contentWidget(BuildContext context) {
    Widget body;
    if (loadStatus == LoadStatus.idle) {
      body = Text(
        AppLocalizations.of(context).swipe_to_load_txt,
        style: AppTheme.title,
      );
    } else if (loadStatus == LoadStatus.loading) {
      body = LoadingAnimation.stillLoading(size: 32);
    } else if (loadStatus == LoadStatus.failed) {
      body = Container();
    } else if (loadStatus == LoadStatus.canLoading) {
      body = Text(
        AppLocalizations.of(context).swipe_to_load_txt,
        style: AppTheme.title,
      );
    } else {
      body = Text(
        AppLocalizations.of(context).no_more_data_txt,
      );
    }
    return !isLoadedLisData
        ? Container()
        : Center(
            child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: body,
          ));
  }
}
