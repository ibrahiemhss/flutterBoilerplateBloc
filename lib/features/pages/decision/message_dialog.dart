import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/fcm_notification_model.dart';
import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {

  final FcmNotificationModel fcmNotification;
  MessageDialog({Key key,
    @required this.fcmNotification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
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
              ),
            ],
          );

  }
}
