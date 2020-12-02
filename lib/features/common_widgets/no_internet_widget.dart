
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  void Function() onRefresh =
      () {};

  NoInternetWidget({this.onRefresh});

  @override
  Widget build(BuildContext context) {
     return Scaffold(

            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(

                    AppLocalizations.of(context).warning_be_conncted_internet_txt,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: AppTheme.blueGrey,
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w400),

                  ),Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: RaisedButton.icon(
                        onPressed: () {
                          onRefresh();
                        },
                        color:AppTheme.primaryDark,
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                        label: Text(AppLocalizations.of(context).refresh_txt,style: TextStyle(color: Colors.white),)),      )

                ],
              ),
            ));

  }
}
