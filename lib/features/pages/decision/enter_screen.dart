import 'dart:convert';
import 'dart:io';
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/notification_handler.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/fcm_notification_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/user_model/user_model_data.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/decision_bloc/decision_bloc.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/decision_bloc/decision_event.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/decision/welcome_page.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/users/main_user_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../injection_container.dart';

class EnterScreen extends StatefulWidget {
  final EnterModel enterModel;
  final DataEntry dataEntry;
  final DecisionBloc bloc;
  final bool loadingData;

  const EnterScreen({Key key, @required this.bloc, @required this.loadingData, @required this.enterModel,@required this.dataEntry}) : super(key: key);

  @override
   createState() {
    return new EnterScreenState();
  }
}
class EnterScreenState extends State<EnterScreen>
    with TickerProviderStateMixin {
  NotificationsHandler notificationsHandler = sl<NotificationsHandler>();

  FcmNotificationModel _fcmNotification;
  final MethodChannel firebasemessagingChannel =
  const MethodChannel('flutterBoilerplateWithbloc.FCMmessage');
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  bool _loadingLists = true;
//==============================================================================
//==============================================================================

  @override
  void initState() {
    if(!widget.loadingData){
      if (Platform.isAndroid) {
        _androidFirebasemessaging();
      } else {
        _iosFirebasemessaging();
      }
    }

    super.initState();
  }

//==============================================================================
//==============================================================================

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
  Scaffold(
        backgroundColor: AppTheme.accentColor,
        body: Center(
            child:
                widget.enterModel.is_enter
                ? MainUserPage(
              fromBack: false,
              pagId: 0,
              enterModel: widget.enterModel,
              dataEntry: widget.dataEntry,
            )
                : WelcomePage(
              enterModel: widget.enterModel,
              dataEntry: widget.dataEntry,
            )
        )
    );
}

//==============================================================================
//==============================================================================

  Future<FcmNotificationModel> _androidFirebasemessaging() async {
    String response = "";
    final String result =
    await firebasemessagingChannel.invokeMethod('firebase_message');
    response = result;
    print('ChannelResult: ${result}');
    _fcmNotification = FcmNotificationModel.fromJson(json.decode(result));
    var queryParameters = {
      APIOperations.USER_ID: widget.enterModel.userModel.id.toString(),
      APIOperations.DEVICE_REG_TOKEN:  _fcmNotification.deviceRegId,
      APIOperations.IS_SIGNED:  widget.enterModel.is_loged_in,

    };
    widget.bloc.saveToken(locale: widget.enterModel.locale,parameters: queryParameters);

    try {
      print(response);
      if (_fcmNotification.isFCM == 'y') {
        widget.bloc.navigateToItemDetail(_fcmNotification);
      }
    } on PlatformException catch (e) {}
  }
//==============================================================================
//==============================================================================

  void _iosFirebasemessaging() {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((token) {
      var queryParameters = {
        APIOperations.USER_ID:!widget.enterModel.is_loged_in?null: widget.enterModel.userModel.id.toString(),
        APIOperations.DEVICE_REG_TOKEN:  token,
        APIOperations.IS_SIGNED:  widget.enterModel.is_loged_in,
      };
      widget.bloc.saveToken(locale: widget.enterModel.locale,parameters: queryParameters);

      // _bloc.emitEvent(DecisionEventLoad(locale: widget.enterModel.locale, token: token));
    });
    _firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> message) async {
        // print("onLaunch ====>  ${message.toString}");

        setMessageValues(message);
        try {
          if (_fcmNotification.senderId !=
             widget.enterModel.userModel.id.toString()) {
            //when cancel appointment from user cancel show any notification
            widget.bloc.navigateToItemDetail(_fcmNotification);
            print(
                "my id= ${widget.enterModel.userModel.id},,sender_id=${_fcmNotification.senderId} ");
          } else {
            print(
                "my id= ${widget.enterModel.userModel.id},,sender_id=${_fcmNotification.senderId} ");
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
          if (_fcmNotification.senderId !=
              widget.enterModel.userModel.id.toString()) {
            //when cancel appointment from user cancel show any notification
            widget.bloc.navigateToItemDetail(_fcmNotification);
            print(
                "my id= ${widget.enterModel.userModel.id},,sender_id=${_fcmNotification.senderId} ");
          } else {
            print(
                "my id= ${widget.enterModel.userModel.id},,sender_id=${_fcmNotification.senderId} ");
          }
        } catch (_) {
          print(_.toString());
        }
      },
      onMessage: (Map<String, dynamic> message) async {
        setMessageValues(message);

        //if (message.containsKey('com.google.firebase.auth')) {
        widget.bloc.showFcmDialog(_fcmNotification);
        //  } else {
        if (_fcmNotification.senderId != widget.enterModel.userModel.id.toString()) {
          //when cancel appointment from user cancel show any notification
          widget.bloc.showFcmDialog(_fcmNotification);
          print(
              "my id= ${widget.enterModel.userModel.id},,sender_id=${_fcmNotification.senderId} ");
        }
      },
    );
  }

//==============================================================================
//==============================================================================

  setMessageValues(Map<String, dynamic> message) {
    try {
      bool is_doctor;
      _fcmNotification=new FcmNotificationModel(
          messageBody:message['message_body'],
          messageTitle:message['message_title'],
          typeKey:message['type_key'],
          sentAt:message['sent_at'],
          doctorId:message['doctor_id'],
          patientId:message['patient_id'],
          theDate:message['the_date'],
          date:message['date'],
          periodIndex:message['period_index'],
          appointmentId:message['appointment_id'],
          senderName:message['sender_name'],
          isDoctor:message['is_doctor']
      );
     /* _fcmNotification.messageBody = message['message_body'];//message_body
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
      }*/
    } catch (e) {
      print("set fcm values error =${e.toString()}");
    }
  }
}
