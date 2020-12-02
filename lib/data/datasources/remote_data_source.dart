
import 'dart:convert';
import 'dart:io';
import 'package:flutterBoilerplateWithbloc/core/http/http_client.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/notification_handler.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/user_model/user_model_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';

abstract class RemoteDataSource {
  Future<void> initNotifications(String user_id);
  Future<dynamic> setUserSignIn({
    String locale,
    Map<String, String>  parameters});
  Future<dynamic> setSignUp({
    String locale,
    Map<String, dynamic>  parameters});
  Future<dynamic> sendPhone({String phoneNumber, String locale,String country_code});
  Future checkCode({String code, String locale});
  Future getPrivacyPolicy({String locale});
  Future<dynamic> setDeviceRegId({String locale,   Map<String, dynamic>  parameters});
    }

class RemoteDataSourceImpl implements RemoteDataSource {

  final HttpClient httpClient;
  final NotificationsHandler notificationsHandler;
  final SharedPreferences sharedPreferences;
  FirebaseMessaging _firebaseMessaging;

  RemoteDataSourceImpl( {@required this.sharedPreferences,@required this.httpClient,@required this.notificationsHandler});
  @override
  Future<void> initNotifications(String user_id) {
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
      notificationsHandler.initNotificationAndGetMessageValue(
          user_id, sharedPreferences);
    });
  }



  @override
  Future<dynamic> setUserSignIn({String locale,   Map<String, String> parameters})async {
    String url = APIConstants.API_LOGIN_URL(locale);

    print("log in URL = $url");
    final response =
    await httpClient.post(url, headers: parameters);
    switch (response[APIOperations.STATUS]) {
      case APIResponse.SUCCESS:
        UserModel userResponse = UserModel.fromJson(response[APIOperations.USER]);
        String userProfileJson = json.encode(userResponse);
        sharedPreferences.setString(SharedPreferenceKeys.USER, userProfileJson);
        sharedPreferences.setBool(SharedPreferenceKeys.IS_USER_LOGGED_IN, true);

        return response;
        break;

      case APIResponse.FAILURE:
        return response;
    }
    return null;
  }

  @override
  Future<dynamic> sendPhone({String phoneNumber, String locale,String country_code}) async{
    String URL = "${APIConstants.API_GET_PRE_REGISTER(locale)}$phoneNumber""?country_code=$country_code";
    print("sendPhone  URL = $URL");
   final respons= await httpClient.get(URL);
    print("sendPhone respons   = ${respons.toString()}");

    return respons;
  }

  @override
  Future checkCode({String code, String locale}) async{
    String URL = "${APIConstants.API_GET_REGISTER_CONFIRM(locale)}$code";
    print("checkCode  URL = $URL");
    final respons= await httpClient.get(URL);
    print("checkCode checkCode   = ${respons.toString()}");

    return respons;

  }
  @override
  Future getPrivacyPolicy({String locale}) async{
    String URL;
    URL = APIConstants.API_GET_PRIVACY_POLICY(locale);
    print("getPrivacyPolicy  URL = $URL");
    final respons= await httpClient.get(URL);
    print("getPrivacyPolicy checkCode   = ${respons.toString()}");

    return respons;

  }
  @override
  Future<dynamic> setDeviceRegId({String locale,  Map<String, dynamic>  parameters}) async{
    print("ON Update DeviceRegId remote data   \n"
        "user id== ${parameters[APIOperations.USER_ID]}"
        "device token == ${parameters[APIOperations.DEVICE_REG_TOKEN]}\n");

    final response =await httpClient.post(APIConstants.API_UPDATE_DEVICE_ID(locale), headers: parameters);

    return response;
  }

  @override
  Future<dynamic> setSignUp({
    String locale,
    Map<String, dynamic>  parameters}) async {
    String url = APIConstants.API_REGISTER_URL(locale);

    print("signup in URL = $url");
    print("signup parameters "
        "\n =============  USER INFO ======================"
        "\n NAME=${parameters[APIOperations.NAME]}"
        "\n PHONE=${parameters[APIOperations.PHONE]}"
        "\n EMAIL=${parameters[APIOperations.EMAIL]}"
        "\n PASSWORD=${parameters[APIOperations.PASSWORD]}"
        "\n name=${parameters[APIOperations.NAME]}"
        "\n GENDER=${parameters[APIOperations.GENDER]}"
        "\n CITY_ID=${parameters[APIOperations.CITY_ID]}"
        "\n ADDRESS=${parameters[APIOperations.ADDRESS]}");

    print("signup parameters "
        "\n =============  WORK TIMES ====================="
            "\n ${parameters[APIOperations.WORK_TIMES]}");

    try{
      final response =await httpClient.post(url, headers: parameters);
      if(response!=null){
        switch (response[APIOperations.STATUS]) {
          case APIResponse.SUCCESS:
            UserModel userResponse = UserModel.fromJson(
                response[APIOperations.USER]);
            String userProfileJson = json.encode(userResponse);
            sharedPreferences.setString(SharedPreferenceKeys.USER, userProfileJson);
            sharedPreferences.setBool(SharedPreferenceKeys.IS_USER_LOGGED_IN, true);
            return response;

            break;

          case APIResponse.FAILURE:
            return null;
            break;
          default :
            return response;
        }
      }else{
        return response;

      }
    }catch(e){
      print("Sign up exception ${e.toString()}");
      return null;

    }



  }

  @override
  Future<void> pushNotfication({Map<String, String>  parameters,String locale}) async{
  String  URL =APIConstants.API_CHAT_PUSH_NOTIFICATION_URL(locale);
  print("push message Notfication URL is =================>\n$URL");

  final response =
      await httpClient.post(URL, headers: parameters);
    return response;
  }

  @override
  Future getPatientAppointments({String user_id, String locale}) async {
    String URL = "${APIConstants.API_GET_USER_APPOINTMENT(locale)}${user_id}";
    print("getPatientAppointments URL is =================>\n$URL");
    final response = await httpClient.get(URL);

    return response;
  }

  @override
  Future postRating(  {Map<String, dynamic>  parameters,locale}) async{
    String URL = APIConstants.API_ADD_REVIEWS_AVERAGE(locale);
    print("getPatientAppointments URL is =================>\n$URL");
    final response =await httpClient.post(URL, headers: parameters);

    return response;
  }


}

