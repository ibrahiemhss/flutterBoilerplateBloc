import 'dart:io';

import 'package:flutterBoilerplateWithbloc/core/http/network_info.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/core/util/redirect.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/repositories/repository.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_provider.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/users/main_user_page.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../injection_container.dart';

enum SIGNUP_ACTIONS {
  changeIndex,
  onAddImage,
  onAcceptPrivacy,
  onChangeChat,
  onSelectLocation,
  loadingSignUp,
  loadedSignUp,
  warningSnackBar,
  signedUp,
  noInternet,
  loadingSendPhone,
  loadedSendPhone,
  loadingCheckCode,
  loadedcheckCode,
  loadingPrivacyPolicy,
  loadedPrivacyPolicy,
  registerState,
  codeState,
  dayStringState,
  phoneNumberState,
  error }


class SignUpBloc extends BlocBase {
  Repository repository;
  NetworkInfo networkInfo;

  SignUpBloc({@required this.repository, @required this.networkInfo}) {
    repository = sl<Repository>();
  }

  final _uiActionsController = BehaviorSubject<UiAction>();
  Stream<UiAction> get getUiActions => _uiActionsController.stream;

   void addImage({bool isAddImage,File imageFile}) {

    _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.onAddImage.index,value: imageFile,value2:isAddImage ));

  }
  void testLoading() {

     print("open Dialoge");
    _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.loadingSignUp.index ));

  }
  void testFinishLoading() {
    print("close Dialoge");

    _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.loadedSignUp.index ));

  }
//==============================================================================
//==============================================================================

  void onAcceptPrivacy({bool value}) {

    _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.onAcceptPrivacy.index,value: value, ));

  }
//==============================================================================
//==============================================================================

  void onChangeChat({bool isChat}) {

    _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.onChangeChat.index,value: isChat, ));

  }

//==============================================================================
//==============================================================================

  void onSelectLocation({Map<String, dynamic> coordinates,bool isHaveValues}) {

    _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.onSelectLocation.index,value: coordinates,value2: isHaveValues ));

  }
//==============================================================================
//==============================================================================

  void addWarning(String message) {
    _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.warningSnackBar.index,value: message));

  }

//==============================================================================
//==============================================================================

  void isUserSignedUp() async {
    _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.loadingSignUp.index));


    //  repository.setCurrentUser(user);
      _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.signedUp.index));

  }

//==============================================================================
//==============================================================================

  void onChangeIndex({int index})  {

    _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.changeIndex.index,value: index));

  }

//==============================================================================
//==============================================================================

  void handleUserSignUp(
      { Map<String, dynamic> parameters,BuildContext context,EnterModel enterModel,DataEntry dataEntry}) async {

    _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.loadingSignUp.index));
    bool checkIntenrnet = await repository.checkIfHaseIntenet();
    repository.checkIfHaseIntenet().then((isConnected) {

      if(isConnected){
        repository.handleSignUp(locale:enterModel.locale,  parameters:parameters)
            .then((result){
              if(result!=null){
                String status= result[APIOperations.STATUS];
                String details= result[APIOperations.ERROR_DETAILS_MESSAGE];
                if (status==APIResponse.SUCCESS) {
                  // Successful signed in
                 // _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.loadedSignUp.index,value: details));
                  EnterModel
                  _enterModel = repository.handleGetEnterModel(locale: enterModel.locale);
                  print("is_loged_in inside bloc after register=${_enterModel.is_loged_in}");
                  Redirect.toPage(
                      context,
                      MainUserPage(
                        fromBack: false,
                        pagId: 0,
                        enterModel:_enterModel,
                        dataEntry: dataEntry,
                      ));
                } else {
                  // Sign in failed
                 // _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.error.index,value: details));
                }
              }else{
              //  _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.error.index,value: AppLocalizations.of(context).unexpected_error_occurred_try_again_txt));

              }

        });

      }else{
        _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.noInternet.index));

      }
    });

  }

//==============================================================================
//==============================================================================

  void preRegister({String phoneNumber, String locale,String country_code}){
    repository.checkIfHaseIntenet().then((isConnected) {

      if(isConnected){
        _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.loadingSendPhone.index));

        repository.handleSendPhone(locale:locale,  phoneNumber:phoneNumber,country_code:country_code)
            .then((result){

          if (result[APIOperations.STATUS] == APIResponse.SUCCESS) {
            _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.loadedSendPhone.index));

          } else {

            _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.error.index,value: result[APIOperations.ERROR_DETAILS_MESSAGE]));


          }});

      }else{
        _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.noInternet.index));

      }
    });

  }

//==============================================================================
//==============================================================================

  void checkCode({String code, String locale}){
    repository.checkIfHaseIntenet().then((isConnected) {

      if(isConnected){
        _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.loadingCheckCode.index));

        repository.handleCheckCode(locale:locale,  code:code)
            .then((result){

          if (result[APIOperations.STATUS] == APIResponse.SUCCESS) {
            _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.loadedcheckCode.index));

          } else {

            _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.error.index,value: result[APIOperations.ERROR_DETAILS_MESSAGE]));


          }});

      }else{
        _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.noInternet.index));

      }
    });

  }

//==============================================================================
//==============================================================================

  void getPrivacyPolicy({String locale}){
    repository.checkIfHaseIntenet().then((isConnected) {

      if(isConnected){
        _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.loadingPrivacyPolicy.index));

        repository.handlePrivacyPolicy(locale:locale)
            .then((result){

          if (result[APIOperations.INFO] !=null) {
            _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.loadedPrivacyPolicy.index,value:result[APIOperations.INFO] ));

          } else {

            _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.error.index));


          }});

      }else{
        _uiActionsController.sink.add(new UiAction(action: SIGNUP_ACTIONS.noInternet.index));

      }
    });

  }
//==============================================================================
//==============================================================================

  void dispose() async {
    await _uiActionsController.drain();
    _uiActionsController.close();

  }
}
