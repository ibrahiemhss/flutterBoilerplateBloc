import 'dart:convert';
import 'dart:io';
import 'package:flutterBoilerplateWithbloc/domain/entities/fcm_notification_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';




class NotificationsHandler {
  FcmNotificationModel _fcmNotification;

   Future<FcmNotificationModel> initNotificationAndGetMessageValue(String user_id,SharedPreferences sharedPreferences) async{


    if (Platform.isAndroid) {
      _initAndroidFirebasemessaging(sharedPreferences);
    } else {
      _initIosFirebasemessaging(user_id,sharedPreferences);
    }
    return await _fcmNotification;
  }
    Future<FcmNotificationModel> _initAndroidFirebasemessaging(SharedPreferences sharedPreferences) async {

    final MethodChannel firebasemessagingChannel = const MethodChannel(
        'flutterBoilerplateWithbloc.FCMmessage');
    String response = "";
    final String result =
    await firebasemessagingChannel.invokeMethod('firebase_message');
    response = result;
    print('ChannelResult: ${result}');
    _fcmNotification = FcmNotificationModel.fromJson(json.decode(result));
    sharedPreferences.setString(SharedPreferenceKeys.SERVER_TOKEN_ID,_fcmNotification.deviceRegId) ;

    print(response);
  }

    void _initIosFirebasemessaging(String user_id,SharedPreferences sharedPreferences) {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((token) {
      // if(user_id!=null){
      print(
          "==========================TOKEN Main PAGE=====================\n $token");
      if(_fcmNotification!=null){
        sharedPreferences.setString(SharedPreferenceKeys.SERVER_TOKEN_ID,token) ;
      }

      // }
    });
    _firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> message) async {
        // print("onLaunch ====>  ${message.toString}");

        setMessageValues(message);
        try {
          if (_fcmNotification.senderId != user_id.toString()) {
            //when cancel appointment from user cancel show any notification
            // _navigateToItemDetail();
            print("my id= ${user_id},,sender_id=${_fcmNotification.senderId} ");
          } else {
            print("my id= ${user_id},,sender_id=${_fcmNotification.senderId} ");
          }
        } catch (_) {
          print(_.toString());
        }
      },
      onResume: (Map<String, dynamic> message) async {
        // print("onResume ====>  ${message.toString}");

        setMessageValues(message);

        // print("onResume ====>  ${message.toString}");

        try {
          if (_fcmNotification.senderId != user_id.toString()) {
            //when cancel appointment from user cancel show any notification
            // _navigateToItemDetail();
            print("my id= ${user_id},,sender_id=${_fcmNotification.senderId} ");
          } else {
            print("my id= ${user_id},,sender_id=${_fcmNotification.senderId} ");
          }
        } catch (_) {
          print(_.toString());
        }
      },
      onMessage: (Map<String, dynamic> message) async {
        setMessageValues(message);

        //if (message.containsKey('com.google.firebase.auth')) {

        //  } else {
        if (_fcmNotification.senderId != user_id.toString()) {
          //when cancel appointment from user cancel show any notification
          //  _showItemDialog(message);
          print("my id= ${user_id},,sender_id=${_fcmNotification.senderId} ");
        }
      },
    );
  }

    setMessageValues(Map<String, dynamic> message) {

    bool is_doctor;
    _fcmNotification.messageBody = message['message_body'];
    _fcmNotification.messageTitle = message['message_title'];
    _fcmNotification.typeKey = message['type_key'];
    _fcmNotification.sentAt = message['sent_at'];
    _fcmNotification.doctorId = message['doctor_id'];
    _fcmNotification.patientId = message['patient_id'];
    _fcmNotification.theDate = message['the_date'];
    _fcmNotification.date = message['date'];
    _fcmNotification.periodIndex = message['period_index'];

    _fcmNotification.appointmentId = message['appointment_id'];
    _fcmNotification.senderName = message['sender_name'];
    _fcmNotification.senderId = message['sender_id'];
    _fcmNotification.isDoctor = message['is_doctor'];
    if (_fcmNotification.isDoctor == 'true') {
      is_doctor = true;
    } else {
      is_doctor = false;
    }
  }
}
