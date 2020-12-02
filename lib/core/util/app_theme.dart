import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); //F57F17
  static BoxDecoration GradiantColors = BoxDecoration(
    gradient: LinearGradient(
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1.0, 0.0),
      colors: [primary, primaryDarkest],
      tileMode: TileMode.clamp,
    ),
  );
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static const String primaryDarkestString = "01579B";
  static const String primaryDarkString = "0277BD";
  static const String primaryString = "0288D1";
  static const String primaryLightString ="03A9F4";
  static const String whiteString ="FFFFFF";

  static const Color primaryDarkest = Color(0xFF01579B);
  static const Color primaryDark = Color(0xFF0277BD);
  static const Color primary = Color(0xFF0288D1);
  static const Color primaryLight = Color(0xFF03A9F4);
  static const Color accentColor = goldenDark;
  static const Color limeYeLLowDark = Color(0xFFAFB42B);
  static const Color greenLight = Color(0xFFC5E1A5);
  static const Color green = Color(0xFF558B2F);
  static const Color greenDark = Color(0xFF33691E);

  static const Color teal = Color(0xFF00695C);
  static const Color blueGrey = Color(0xFF607D8B);
  static const Color red = Color(0xFFd50000); //f44336
  static const Color redLight = Color(0xFFf44336);

  static const Color redDark = Color(0xFFb71c1c);

  static const Color nearWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFFAFAFA);

  static const Color darkWhite = Color(0xFFEEEEEE);
  static const Color whiteTransparent = Color(0x77ffffff);

  static const Color background = Color(0xFFF2F3F8);

  static const Color nearlyBlack = Color(0xFF213333);
  static const Color greyDark = Color(0xFF707070);
  static const Color grey = Color(0xFF9e9e9e);
  static const Color greyLight = Color(0xFFBDBDBD);
  static const Color greyLighter = Color(0xFFE0E0E0);

  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color goldenDarker = Color(0xFFF57F17);
  static const Color goldenDark = Color(0xFFF9A825);
  static const Color golden = Color(0xFFFBC02D);
  static const Color goldenLight = Color(0xFFFDD835);

  //status colors
  static const Color PLACED = Color(0xFF01579B);
  static const Color SCHEDULED = Color(0xFF9E9D24);
  static const Color IN_PROGRESS = Color(0xFF0097A7);
  static const Color DONE = Color(0xFF4CAF50);
  static const Color CANCELED = Color(0xFFd50000);

  static const Color WHATSAPP_COLOR = Color(0xFF25D366); //25D366
  static const Color VIBER_COLOR = Color(0xFF665CAC); //665CAC
  static const Color TELEGRAM_COLOR = Color(0xFF0088cc); //0088cc
  static const Color FACEBOOK_COLOR = Color(0xFF4267B2); //0088cc

  static const CanvasColor = Color(0xfff4f4f4);

  static const String cairoFont = 'Cairo';
  static const String tajawalFont = 'Tajawal';
  static const String fontName = cairoFont;

  static const TextTheme textTheme = TextTheme(
    display1: display1,
    headline: headline,
    title: title,
    subtitle: subtitle,
    body2: body2,
    body1: body1,
    caption: veryTinyText,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );
  static const TextStyle accentHeadline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: goldenDarker,
  );

  static const TextStyle headlineLight = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.27,
    color: white, // was lightText
  );

  static const TextStyle titleDark = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: primaryDarkest,
  );
  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: primary,
  );
  static const TextStyle titleLight = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: white,
  );

  static const TextStyle tinyText = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.18,
    color: primary,
  );
  static const TextStyle tinyTextLight = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.18,
    color: white,
  );
  static const TextStyle veryTinyText = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 8,
    letterSpacing: 0.025,
    color: primary, // was lightText
  );

  static const TextStyle veryTinyTextLight = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 8,
    letterSpacing: 0.025,
    color: white, // was lightText
  );
  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );
  static const TextStyle subtitleInfo = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: grey,
  );

  static const TextStyle subtitleLight = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: white,
  );
  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );
  static const TextStyle body2Light = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );
  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );
  static const TextStyle body1Light = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static BoxDecoration GradientColors = BoxDecoration(
    gradient: LinearGradient(
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1.0, 0.0),
      colors: [primary, primaryDarkest],
      tileMode: TileMode.clamp,
    ),
  );
}
