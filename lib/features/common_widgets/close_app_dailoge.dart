import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CloseApp{
  static AlertDialog alert (BuildContext context){
   return  AlertDialog(
      title: new Text(AppLocalizations.of(context).confirm_closing_Hijozty_txt,
          style: new TextStyle(color: Colors.black, fontSize: 20.0)),
     //content: new Text(AppLocalizations.of(context).warinig_confirm_closing_Hijozty_txt
      //),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            // this line exits the app.
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          child: new Text(AppLocalizations.of(context).yes_txt, style: new TextStyle(fontSize: 18.0)),
        ),
        new FlatButton(
          onPressed: () => Navigator.pop(context),
          // this line dismisses the dialog
          child: new Text(AppLocalizations.of(context).no_txt, style: new TextStyle(fontSize: 18.0)),
        )
      ],
    );
  }
}
