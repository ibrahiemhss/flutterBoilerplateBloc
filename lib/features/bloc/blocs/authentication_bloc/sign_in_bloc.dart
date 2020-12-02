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

enum SIGNING_ACTIONS {
  signedOut,
  loadingSignIn,
  loadedSignIn,
  warningSnackBar,
  signedIn,
  noInternet,
  error }

class SignInBloc extends BlocBase {
  Repository repository;
  NetworkInfo networkInfo;

//==============================================================================
//==============================================================================
  SignInBloc({@required this.repository, @required this.networkInfo}) {
    repository = sl<Repository>();
  }

//==============================================================================
//==============================================================================
  final _uiActionsController = BehaviorSubject<UiAction>();
  Stream<UiAction> get getUiActions => _uiActionsController.stream;

//==============================================================================
//==============================================================================
  void addWarning(String message) {
    _uiActionsController.sink.add(new UiAction(action: SIGNING_ACTIONS.warningSnackBar.index,value: message));

  }
//==============================================================================
//==============================================================================
  void isUserSignedIn() async {
    _uiActionsController.sink.add(new UiAction(action: SIGNING_ACTIONS.loadingSignIn.index));

    var isSignedIn = await repository.handleCheckUserSignedIn();
    var user = await repository.handleGetCurrentLocalUser();

    if (isSignedIn && user != null) {
      repository.setCurrentUser(user);
      _uiActionsController.sink.add(new UiAction(action: SIGNING_ACTIONS.signedIn.index));

    } else {
      _uiActionsController.sink.add(new UiAction(action: SIGNING_ACTIONS.signedOut.index));
    }
  }
//==============================================================================
//==============================================================================

  void handleUserSignIn(
      {
        String locale,
        Map<String, String> parameters,BuildContext context,EnterModel enterModel,DataEntry dataEntry}) async {
    _uiActionsController.sink.add(new UiAction(action: SIGNING_ACTIONS.loadingSignIn.index));

    bool checkIntenrnet = await repository.checkIfHaseIntenet();
    repository.checkIfHaseIntenet().then((isConnected) {

      if(isConnected){
    repository.handleUserSignIn(locale:locale,parameters:parameters)
            .then((result){
              if(result!=null){
                String status= result[APIOperations.STATUS];
                String details= result[APIOperations.ERROR_DETAILS_MESSAGE];
                if (status==APIResponse.SUCCESS) {
                  // Successful signed in
                  _uiActionsController.sink.add(new UiAction(action: SIGNING_ACTIONS.loadedSignIn.index,value: details));
                  EnterModel
                  _enterModel = repository.handleGetEnterModel(locale: enterModel.locale);
                  Redirect.toPage(context, MainUserPage(
                    fromBack: false,
                    pagId: 0,
                    enterModel: _enterModel,
                    dataEntry: dataEntry,
                  ));
                } else {
                  // Sign in failed
                  _uiActionsController.sink.add(new UiAction(action: SIGNING_ACTIONS.error.index,value: details));
                }
              }else{
                _uiActionsController.sink.add(new UiAction(action: SIGNING_ACTIONS.error.index,value: AppLocalizations.of(context).unexpected_error_occurred_try_again_txt));

              }
        });

      }else{
        _uiActionsController.sink.add(new UiAction(action: SIGNING_ACTIONS.noInternet.index));

      }
    });

  }

  void dispose() async {
    await _uiActionsController.drain();
    _uiActionsController.close();

  }
}
