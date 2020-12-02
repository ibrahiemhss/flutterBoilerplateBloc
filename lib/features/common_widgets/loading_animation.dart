import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimation {

  static Widget stillLoading ({double size,Color color}){

    return SpinKitThreeBounce(
      color: color??AppTheme.accentColor,
      size: size??50.0,

    );

  }

 static void initDialoge(BuildContext context,bool open,{String text}){
    bool isOpen=false;
    Function dismiss(){
      isOpen=false;
    }
    Function show(){
      isOpen=true;

    }
    showDialog(
        context: context,
        builder: (context) {

          if(!open){
            WidgetsBinding.instance.addPostFrameCallback((_){
             // Navigator.of(context).pop(true);
              Navigator.of(context, rootNavigator: true).pop(true);
            });
          }
          return AlertDialog(
            title: progressDialog(context,text: text),
          );
        });
  }
  static  Widget progressDialog(BuildContext context,{String text}) {

    return Theme(
      data:
      Theme.of(context).copyWith(dialogBackgroundColor: Colors.transparent),
      child: AlertDialog(
        content: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppTheme.greyLight,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  stillLoading(),
                  text!=null? Text(
                    text,
                    style: AppTheme.titleLight,
                  ):Container(),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[],
      ),
    );
  }
}
