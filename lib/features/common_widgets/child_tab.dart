
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutter/material.dart';

class ChildTabe {



    static   Widget veiw(int textType,String title, IconData icon ,Color iconeColor) {
      if (textType == 1) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[

              Icon(
                icon,
                color: iconeColor,
              ),
              Column(
                children: <Widget>[
                  Text(title,

                      style: AppTheme.veryTinyTextLight,

                  )
                ],
              )
            ],
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            alignment: Alignment.center,
            //   padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: <Widget>[

                Icon(
                  icon,
                  color: iconeColor,
                ),
                Column(
                  children: <Widget>[
                    Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppTheme.veryTinyTextLight,


                    ),

                  ],
                ),

              ],
            ),
          ),
        );
      }
    }
}
