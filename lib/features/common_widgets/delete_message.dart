
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class DeleteChatDialog extends StatefulWidget {
  final String messageTime;
  final bool isMe;
  final String locale;
  DeleteChatDialog({
  @required this.messageTime,
  @required this.isMe,
  @required this.locale});
  @override
  State<StatefulWidget> createState() => DeleteChatDialogState();
}

class DeleteChatDialogState extends State<DeleteChatDialog>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> scaleAnimation;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0,left: 20,right: 20),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Column(

                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        AppLocalizations.of(context).details_txt,
                        textAlign: TextAlign.center,
                        style: AppTheme.title,
                      ),
                  widget. messageTime==null?
                      Container()
                  :
                      Text(
                        "${AppLocalizations.of(context).send_txt} ${_timeAgoSinceDate(widget. messageTime)}"
                        ,
                        textAlign: TextAlign.center,
                        style: AppTheme.subtitle,

                      ),
                      SizedBox(
                        width: 24,
                      ),
                      widget.isMe==null?
                          Container():
                      widget.isMe? Text(
                        AppLocalizations.of(context).warning_delete_message_txt,
                        textAlign: TextAlign.center,
                        style: AppTheme.subtitleInfo,
                      ):Container(),
                      widget.isMe==null?
                      Container():
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            widget.isMe? InkWell(
                              onTap: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    AppLocalizations.of(context).delete_txt,
                                    style: AppTheme.title,

                                  ),
                                ),
                              ),
                            ):Container(),
                            SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    AppLocalizations.of(context).close_txt,
                                    style: AppTheme.title,

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
      //=============
    );
  }

  String _timeAgoSinceDate(String dateString, {bool numericDates = true}) {
    DateTime date = DateTime.parse(dateString);
    if (widget.locale == 'ar') {
      timeAgo.setLocaleMessages('ar', timeAgo.ArMessages());
      return timeAgo.format(date, locale: 'ar');
    } else {
      timeAgo.setLocaleMessages('en', timeAgo.ArMessages());
      return timeAgo.format(date, locale: 'en');
    }
  }
}
