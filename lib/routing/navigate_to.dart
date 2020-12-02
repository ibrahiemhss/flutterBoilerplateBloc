
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/fcm_notification_model.dart';
import 'package:flutter/material.dart';

class NavigateToRoute {
  static void navigateToItemDetail({BuildContext context,FcmNotificationModel fcmNotificationModel}) {
    if (int.parse(fcmNotificationModel.typeKey) == FCMpayload.CHAT_MSG) {
      Navigator.pushNamed(context, '/requestAppointment');
    } else if (int.parse(fcmNotificationModel.typeKey) == FCMpayload.CHAT_MSG) {
    Navigator.pushNamed(context, '/chat');

  }
  }

}
