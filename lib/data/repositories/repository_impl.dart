import 'dart:async';
import 'package:flutterBoilerplateWithbloc/core/error/exception.dart';
import 'package:flutterBoilerplateWithbloc/core/http/network_info.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/data/datasources/local_data_source.dart';
import 'package:flutterBoilerplateWithbloc/data/datasources/remote_data_source.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/international_service.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/user_model/user_model_data.dart';import 'package:flutterBoilerplateWithbloc/domain/repositories/repository.dart';
import 'package:flutter/foundation.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
        @required this.networkInfo});

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  String handleGetLocaleLanguageSaved() {
    return localDataSource.getLocaleLang();
  }


  @override
  void setFirstEnter() {
    localDataSource.setFirstEnter();
  }
  @override
  void saveDeviceRegId({String locale,   Map<String, dynamic>  parameters}) {
    print("ON Update DeviceRegId repository   \n"
        "user id== ${parameters[APIOperations.USER_ID]}"
        "device token == ${parameters[APIOperations.DEVICE_REG_TOKEN]}\n");

    if(parameters[APIOperations.IS_SIGNED]){
      remoteDataSource.setDeviceRegId(locale:locale,parameters: parameters ).then((value){
        print("on update token ${value.toString()}");
      });
    }

    localDataSource.saveDeviceRegId(parameters[APIOperations.DEVICE_REG_TOKEN]);
  }

  @override
  // TODO: implement currentUser
  Stream<UserModel> get currentUser => null;

  @override
  Future<UserModel> handleGetCurrentLocalUser() {
    // TODO: implement getCurrentLocalUser
    return null;
  }

  @override
  UserModel handleGetCurrentUser() {
    // TODO: implement getCurrentUser
    return null;
  }

  @override
  Future<dynamic> handleUserSignIn({
        String locale,
        Map<String, String> parameters}) async{
    return await remoteDataSource.setUserSignIn(locale:locale,parameters:parameters);
  }
  @override
  Future handleSignUp({String locale,Map<String, dynamic> parameters}) async {
    return await remoteDataSource.setSignUp(locale:locale,parameters:parameters);
  }
  @override
  Future handleSendPhone({String phoneNumber, String locale,String country_code}) async{
    // TODO: implement handleSendPhone
    return await remoteDataSource.sendPhone(locale:locale,phoneNumber:phoneNumber,country_code:country_code);
  }

  @override
  Future handleCheckCode({String code, String locale}) async {
    // TODO: implement handleCheckCode
    return await remoteDataSource.checkCode(locale:locale,code:code);
  }
  @override
  Future handlePrivacyPolicy({String locale}) async{
    // TODO: implement handlePrivacyPolicy
    return await remoteDataSource.getPrivacyPolicy(locale:locale);

  }

  @override
  Future<void> handleUserSignOut({ String locale,
    Map<String, dynamic>  parameters}) {
   return remoteDataSource.setDeviceRegId(locale:locale,parameters:parameters);
  }

  @override
  Future<bool> handleCheckUserSignedIn() {
    // TODO: implement isUserSignedIn
    return null;
  }

  @override
  void setCurrentUser(UserModel user) {
    // TODO: implement setCurrentUser
  }

  @override
  Future<bool> initNotifications(String user_id) async{
    try{
      remoteDataSource.initNotifications(user_id);
      return true;
    }catch(e){
      print("FCM ini Exception= ${e.toString()}");
      return false;
    }

  }
  @override
  bool get getcheckIntenetStatus {
    networkInfo.isConnected.then((hasConnection) {
      return hasConnection;
    }).catchError((error) {
      return false;
    });
  }

  @override
  EnterModel handleGetEnterModel({String locale}) {
    return localDataSource.getEnterModelValues(locale:locale);
  }

  @override
  Future<DataEntry> handleGetDataEntry(String locale) async {
    bool isConnected = await networkInfo.isConnected;

    DataEntry dataEntry;

      return dataEntry;
    }
  }


  @override
  void handleChangeLanguage(String locale) {
   localDataSource.setLanaguage(locale);
  }

  @override
  Future<List<Chatmodel>> handleGetAllMessages(EnterModel enterModel) async{
    return await remoteDataSource.getChat(enterModel:enterModel);
  }

  @override
  UserModel handleGetUserModel() {

    return localDataSource.getUserData();
  }

  @override
  Future handlePushNotfication({Map<String, String> parameters, String locale}) {
    return remoteDataSource.pushNotfication(parameters:parameters,locale:locale);
  }

  @override
  Future handleGetPatientAppointments({String user_id, String locale}) async{
    return  await remoteDataSource.getPatientAppointments(user_id: user_id,locale: locale);
  }

  @override
  Future handlePostRating({Map<String, dynamic>  parameters,locale}) async {
    return  await remoteDataSource.postRating(parameters:parameters,locale: locale);
  }
  }






/*  @override
  Future<Either<Failure, List<FeedItem>>> getFeeds() async {
    bool isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      try {
        final list = await localDataSource.getlist();
        return Right(list);
      } on CacheException {
        return Left(CacheFailure(message: 'Cache Error'));
      }
    }
    try {
      final feed = await remoteDataSource.getFeed();
      localDataSource.saveFeed(feed);
      return Right(feed);
    } on APIException {
      return Left(APIFailure(message: 'Api Error'));
    }
  }*/


