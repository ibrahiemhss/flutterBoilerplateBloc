import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingDialog extends StatelessWidget {
  String warningTitle;
  void Function() onColse = () {};


  SettingDialog(this.warningTitle,this.onColse);
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(top: 55.0),
        child: Center(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButtonLocation: FloatingActionButtonLocation
                .endFloat,
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.close), onPressed: () {
              onColse();
              Navigator.of(context).pop(true);
              ///
              ///
              ///TODO ----------------------------------------------------
            },),
            body:
            Container(

              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),

              child:
              ListView(
                // mainAxisSize: MainAxisSize.min,

                shrinkWrap: true,
                children: <Widget>[

                  Container(
                    width: 250,
                    child: Text(warningTitle,
                        style: AppTheme.subtitle),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[


                      Padding(
                          padding: const EdgeInsets.only(left: 32, right: 32),
                          child: RaisedButton.icon(
                            onPressed: () {
                              onColse();
                              goo_settings(context);

                            },
                            color:AppTheme.accentColor,

                            label: Text(
                              AppLocalizations.of(context). go_settings_txt
                              ,style: AppTheme.subtitleLight,)
                            ,
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: AppTheme.white,
                            ),
                          )),

                    ],
                  )
                ],
              ),
            ),
          ),),

      ),


      //=============


    );
  }

  void goo_settings(BuildContext context) async {
    if(await PermissionHandler().openAppSettings()){
      Navigator.of(context).pop(true);

    }
  }
}
