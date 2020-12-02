import 'dart:convert';


import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchSupportDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LaunchSupportDialogState();
}

class LaunchSupportDialogState extends State<LaunchSupportDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _containe_text_width;
    double _containe_height;

    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      _containe_height = MediaQuery.of(context).size.width / 1.1;
      _containe_text_width = MediaQuery.of(context).size.height / 1.2;
    } else {
      _containe_height = MediaQuery.of(context).size.height / 1.1;
      _containe_text_width = MediaQuery.of(context).size.width / 1.2;
    }

    return Material(
      color: Colors.transparent,
      child: ScaleTransition(
          scale: scaleAnimation,
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Center(
              child: Container(
                  // height: _containe_height,
                  child: Scaffold(
                key: _scaffoldKey,
                backgroundColor: Colors.transparent,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endDocked,
                floatingActionButton: FloatingActionButton.extended(
                  label: Text(AppLocalizations.of(context).close_txt),
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),

                body: Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(15.0),
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[


                        item(context, Icon(Icons.call,color:AppTheme.goldenDarker ,),
                            AppLocalizations.of(context).direct_contact_txt, () {
                              launch("tel://0096407716248400");//0096407716248400
                            },AppTheme.goldenDarker),
                        _itemsDivider(context,AppTheme.goldenDarker),

                        item(context, Icon(FontAwesomeIcons.facebookMessenger,color:AppTheme.FACEBOOK_COLOR ,),
                            'Messenger', () {
                              messengerOpen();
                            },AppTheme.FACEBOOK_COLOR),
                        _itemsDivider(context,AppTheme.FACEBOOK_COLOR),

                        item(context, Icon(FontAwesomeIcons.whatsapp,color:AppTheme.WHATSAPP_COLOR ,),
                            'WhatsApp', () {
                              whatsAppOpen();
                            },AppTheme.WHATSAPP_COLOR),
                        _itemsDivider(context,AppTheme.WHATSAPP_COLOR),

                        item(context, Icon(FontAwesomeIcons.telegram,color:AppTheme.TELEGRAM_COLOR ,),
                            'Telegram', () {
                              telegramOpen();
                            },AppTheme.TELEGRAM_COLOR),
                        _itemsDivider(context,AppTheme.TELEGRAM_COLOR),

                        item(context, Icon(FontAwesomeIcons.viber,color:AppTheme.VIBER_COLOR ,),
                            'Viber', () {
                              viberOpen();
                            },AppTheme.VIBER_COLOR),
                        _itemsDivider(context,AppTheme.VIBER_COLOR),


                      ],
                    )),
              )),
            ),
          )

          //=============
          ),
    );
  }
  _itemsDivider(BuildContext context,Color color) {
    double _width;

    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      _width = MediaQuery.of(context).size.width / 1.310;
    } else {
      _width = MediaQuery.of(context).size.height / 5.7;
    }
    return Container(
      alignment: Alignment.centerRight,
      width: _width,
      color: color,
      height: 1.0,
    );
  }
  void whatsAppOpen() async {
    var whatsappUrl = "https://chat.whatsapp.com/GOMhyCG3cBwCaqPRn2n1cH";
    await canLaunch(whatsappUrl) ? launch(whatsappUrl) : Toast.show(
        'WhatsApp ${AppLocalizations.of(context).app_not_found_txt}',
        context, duration: Toast.LENGTH_SHORT,
        gravity:
        Toast.BOTTOM,
        backgroundColor: AppTheme.WHATSAPP_COLOR,
        textColor: Colors.white);
  }

  void telegramOpen() async {
    var tgUrl = "https://t.me/flutterBoilerplateWithbloc";
    await canLaunch(tgUrl)? launch(tgUrl):Toast.show('Telegram ${AppLocalizations.of(context).app_not_found_txt}',
        context, duration: Toast.LENGTH_SHORT,
        gravity:
        Toast.BOTTOM,
        backgroundColor: AppTheme.TELEGRAM_COLOR,
        textColor: Colors.white);
  }

  void viberOpen() async {
    var tgUrl = "https://invite.viber.com/?g2=AQACTJ74Gf%2BZREq2rVZPAd%2FvDCIXsCLh2zOtzTynKAJQeqKmWaB7rSpy4P0aBug4";
    await canLaunch(tgUrl)? launch(tgUrl):
    Toast.show('Viber ${AppLocalizations.of(context).app_not_found_txt}',
        context, duration: Toast.LENGTH_SHORT,
        gravity:
        Toast.BOTTOM,
        backgroundColor: AppTheme.VIBER_COLOR,
        textColor: Colors.white);

  }
  void  messengerOpen() async {
    var tgUrl = "https://m.me/flutterBoilerplateWithbloc";
    await canLaunch(tgUrl)? launch(tgUrl):
    Toast.show('Messenger ${AppLocalizations.of(context).app_not_found_txt}',
        context, duration: Toast.LENGTH_SHORT,
        gravity:
        Toast.BOTTOM,
        backgroundColor: AppTheme.FACEBOOK_COLOR,
        textColor: Colors.white);

  }


  Widget item(BuildContext context, Widget icon, String title, Function onPressed,Color itemColor){
    return
      RawMaterialButton(
        fillColor: Colors.white,
        splashColor: AppTheme.greyLight,
        elevation: 0.0,
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              icon==null?Container(): Container(child: icon),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Container(
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color:
                        itemColor,
                        fontFamily: AppTheme.fontName),
                  ),
                ),
              ),
              Container(
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
                    color: itemColor,
                  )),
            ],
          ),
        ),
        onPressed: onPressed,
      );

  }

}
