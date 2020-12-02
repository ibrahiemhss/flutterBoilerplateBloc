
import 'package:clay_containers/clay_containers.dart';
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutter/material.dart';

class Item {


  static Widget itemSetting( BuildContext context, Widget icon, String title, Function onPressed,Color itemColor) {
   double _width;

    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
    //  _width = MediaQuery.of(context).size.width / 2;
    } else {
    //  _width = MediaQuery.of(context).size.height / 2.7;
    }
    return ClayContainer(
      color: AppTheme.white,
      borderRadius: 75,
      child: RawMaterialButton(
        fillColor: Colors.white,
        splashColor: AppTheme.greyLighter,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left:4.0,right: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            icon==null?Container(): Container(child: icon),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Container(
                   width: _width,
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color:
                          AppTheme.grey,
                      fontFamily: AppTheme.fontName),
                    ),
                  ),
                ),
                Container(
                 // width: _width,
                ),
                Container(
                    margin: EdgeInsets.only(top: 4.0),
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppTheme.white,
                        size: 10.0,
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.primaryDark,
                    )),
              ],
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );

  }

  static Widget itemContries({ BuildContext context, String count, String service_name, Function onPressed}) {

    return ClayContainer(
      curveType: CurveType.convex,
      color: AppTheme.white,
      child: RawMaterialButton(
        fillColor: Colors.white,
        splashColor: AppTheme.grey,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left:4.0,right: 4.0),
            child: Row(
             // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                        child: Text(
                          service_name,
                          textAlign: TextAlign.left,
                          style: AppTheme.title,
                        ),
                      ),
                    ),
                    SizedBox(width: 6,),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(
                            "${count}",
                            textAlign: TextAlign.center,
                            style: AppTheme.subtitleInfo,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                    margin: EdgeInsets.only(top: 4.0),
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppTheme.dark_grey,
                        size: 10.0,
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.greyLight,
                    )),
              ],
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );

  }

}
