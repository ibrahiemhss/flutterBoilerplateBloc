import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/appbar/gf_appbar.dart';
import 'package:getflutter/components/button/gf_icon_button.dart';
import 'package:getflutter/types/gf_button_type.dart';

class BaseAppbar  {


  Widget build({BuildContext context,String title,Function goScreen,bool isShowLeading,Widget widgetTitle}) {

    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
      //  case TargetPlatform.macOS:
        // TODO: Handle this case.
      //    break;
      }
      assert(false);
      return null;
    }
    return GFAppBar(
      backgroundColor: AppTheme.primary,
      leading: isShowLeading? GFIconButton(
        icon: Icon(_backIcon(),
          color: Colors.white,
        ),
        onPressed: ()=> goScreen(),
        type: GFButtonType.transparent,
      ):Container(),
      title: widgetTitle==null? Text(title,
          style: AppTheme.titleLight):widgetTitle,
    );
  }


}
