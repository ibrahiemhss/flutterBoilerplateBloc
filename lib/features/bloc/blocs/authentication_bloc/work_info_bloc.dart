
import 'dart:async';

import 'package:flutterBoilerplateWithbloc/core/http/network_info.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/core/util/redirect.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/repositories/repository.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_event_state.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_provider.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/users/main_user_page.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../injection_container.dart';
import 'sign_up_bloc.dart';
enum WORK_INFO_ACTIONS {
  initChanges,
  deferenceBetweenPeriods,
  isContainsCorrectPeriod,
  dayStringState,
  onAddPeriod,
  onSelectTimeOfPeriod,
  onChangeStartTime,
  onChangeEndTime,
  loadingSignUp,
  loadedSignUp,
  noInternet,
  error
}
class WorkInfoBloc
    extends SignUpBloc {


  final _uiActionsController = BehaviorSubject<UiAction>();

  Stream<UiAction> get getUiActions => _uiActionsController.stream;

  initChanges() {
    _uiActionsController.sink
        .add(new UiAction(action: WORK_INFO_ACTIONS.initChanges.index));
  }

//==============================================================================
//==============================================================================

  void addDayStrings() {

    _uiActionsController.sink.add(new UiAction(action: WORK_INFO_ACTIONS.dayStringState.index ));

  }
//==============================================================================
//==============================================================================
  void onAddPeriod({@required int dayIndex,@required int periodIndex,@required bool isDeleted}) {
    _uiActionsController.sink
        .add(new UiAction(action: WORK_INFO_ACTIONS.onAddPeriod.index,value: dayIndex,value2:periodIndex,value3: isDeleted ));

  }
//==============================================================================
//==============================================================================
  void onSelectTimeOfPeriod({@required int dayIndex,@required int periodIndex,@required bool isSelected}) {
    _uiActionsController.sink
        .add(new UiAction(action: WORK_INFO_ACTIONS.onSelectTimeOfPeriod.index,value: dayIndex,value2:periodIndex,value3: isSelected ));

  }

//==============================================================================
//==============================================================================
  void onChangeStartTime({@required int dayIndex,@required int periodIndex,@required String time}) {
    _uiActionsController.sink
        .add(new UiAction(action: WORK_INFO_ACTIONS.onChangeStartTime.index,value: dayIndex,value2:periodIndex,value3: time ));

  }
//==============================================================================
//==============================================================================
  void onChangeEndTime({@required int dayIndex,@required int periodIndex,@required String time}) {
    _uiActionsController.sink
        .add(new UiAction(action: WORK_INFO_ACTIONS.onChangeEndTime.index,value: dayIndex,value2:periodIndex,value3: time ));

  }
//==============================================================================
//==============================================================================

  getDeferenceBetweenPeriods(int deference) {
    _uiActionsController.sink
        .add(new UiAction(action: WORK_INFO_ACTIONS.deferenceBetweenPeriods.index,value:deference));
  }

//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================

  void handleUserSignUp(
      {
        Map<String, dynamic> parameters,BuildContext context,EnterModel enterModel,DataEntry dataEntry}) async {
    _uiActionsController.sink.add(new UiAction(action: WORK_INFO_ACTIONS.loadingSignUp.index));
    bool checkIntenrnet = await repository.checkIfHaseIntenet();
    repository.checkIfHaseIntenet().then((isConnected) {

      if(isConnected){
        repository.handleSignUp(locale:enterModel.locale,  parameters:parameters)
            .then((result){
          if(result!=null){
            String status= result[APIOperations.STATUS];
            String details= result[APIOperations.ERROR_DETAILS_MESSAGE];
            if (status==APIResponse.SUCCESS) {
              // Successful signed up
              EnterModel
              _enterModel = repository.handleGetEnterModel(locale: enterModel.locale);

              _uiActionsController.sink.add(new UiAction(action: WORK_INFO_ACTIONS.loadedSignUp.index,value: details));
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
              // Sign up failed
              _uiActionsController.sink.add(new UiAction(action: WORK_INFO_ACTIONS.error.index,value: details));
            }
          }else{
              _uiActionsController.sink.add(new UiAction(action: WORK_INFO_ACTIONS.error.index,value: AppLocalizations.of(context).unexpected_error_occurred_try_again_txt));

          }

        });

      }else{
        _uiActionsController.sink.add(new UiAction(action: WORK_INFO_ACTIONS.noInternet.index));

      }
    });

  }

//==============================================================================
//==============================================================================

  @override
  void dispose() async{
    await _uiActionsController.drain();
    _uiActionsController?.close();

  }


}
