import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutter/material.dart';

class DrOutlineButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  double textSize;
  double width;
  double height;
  Color color;
  IconData icon;
  double spaceBetween;
  Image icon_image;
  DrOutlineButton({
    @required this.text,
    this.textSize,
    this.color,
    this.width,
    this.height,
    this.spaceBetween,
    this.icon,
    this.icon_image,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height == null ? 40 : height,
        width: width == null ? 100 : width,
        child: OutlineButton(
          padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 4),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                    color: color == null ? AppTheme.primary : color,
                    fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.bold,
                    fontSize: textSize == null ? 18 : textSize),
                textAlign: TextAlign.center,
              ),
            spaceBetween!=null?Container(width:spaceBetween ,):Container(),
              icon_image!=null?icon_image:
            icon==null?Container():
            Icon(icon,color: color,),
            ],
          ),
          borderSide: BorderSide(
              color: color == null ? AppTheme.primary : color,
              width: 2),
          shape: StadiumBorder(),
          onPressed: onPressed,
        ));
  }
}
