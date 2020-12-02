
import 'dart:async';


import 'package:flutterBoilerplateWithbloc/core/http/network_info.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/domain/repositories/repository.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_provider.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injection_container.dart';

enum SETTINGS_ACTIONS {
  onSigningOut,
  onSignedOut,
  onChangeLanguage,
  onRequestReview,
  onStoreListing,
  onSignOut,
  noInternet,
  error
}
class SettingsBloc
    extends BlocBase {
  Repository repository;
  NetworkInfo networkInfo;

  SettingsBloc({@required this.repository, @required this.networkInfo}){
    repository = sl<Repository>();
    networkInfo = sl<NetworkInfo>();
  }

  final _uiActionsController = BehaviorSubject<UiAction>();
  Stream<UiAction> get getUiActions => _uiActionsController.stream;

//==============================================================================
//==============================================================================
changeLanguage(String locale){
  repository.handleChangeLanguage(locale);
      _uiActionsController.sink
      .add(new UiAction(action: SETTINGS_ACTIONS.onChangeLanguage.index,value:locale));

}
//==============================================================================
//==============================================================================
  requestReview(output){
    _uiActionsController.sink
        .add(new UiAction(action: SETTINGS_ACTIONS.onRequestReview.index,value:output));

  }
  storeListing(output){
    _uiActionsController.sink
        .add(new UiAction(action: SETTINGS_ACTIONS.onStoreListing.index,value:output));

  }
//==============================================================================
//==============================================================================
  signOut({String locale,Map<String, dynamic>  parameters}){
    _uiActionsController.sink
        .add(new UiAction(action: SETTINGS_ACTIONS.onSigningOut.index,value:locale));

    repository.checkIfHaseIntenet().then((isConnected) {

      if(isConnected){
        repository.handleUserSignOut(locale:locale,parameters:parameters).then((result) {
          String status= result[APIOperations.STATUS];
          String details= result[APIOperations.ERROR_DETAILS_MESSAGE];
          if (status==APIResponse.DONE) {
            _uiActionsController.sink
                .add(new UiAction(action: SETTINGS_ACTIONS.onSignedOut.index));

          }else{
            _uiActionsController.sink
                .add(new UiAction(action: SETTINGS_ACTIONS.error.index));

          }

        });
      }else{
        _uiActionsController.sink
            .add(new UiAction(action: SETTINGS_ACTIONS.noInternet.index));

      }
    });


  }
  @override
  void dispose() async{
    await _uiActionsController.drain();
    _uiActionsController?.close();

  }


}
