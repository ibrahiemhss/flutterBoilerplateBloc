import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonGradientButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;
  double textSize;
  double width;
  double height;

  CommonGradientButton({
    @required this.text,
    this.textSize,
    this.width,
    this.height,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(4),
      height: height == null ? 40 : height,
      width: width == null ? 120 : width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          colors: [ AppTheme.primaryDarkest, AppTheme.primaryLight],
          tileMode: TileMode.clamp,
        ),
      ),
      child: new FlatButton(
        splashColor:AppTheme.primary,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                    fontFamily: AppTheme.fontName,
                    color: AppTheme.white,
                    fontSize: textSize == null ? 18 : textSize),
              ),
              const SizedBox(
                width: 8.0,
              ),
            ],
          ),
        ),
        //onPressed:onPressed,
        onPressed: onPressed,
      ),
    );
  }
}
