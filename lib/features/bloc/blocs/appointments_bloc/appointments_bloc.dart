
import 'dart:async';

import 'package:flutterBoilerplateWithbloc/core/http/network_info.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/repositories/repository.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_event_state.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_provider.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../injection_container.dart';

enum APPOINTMENT_ACTIONS {
  error,
  showToast,
  navigatePage,
  loadingAppointments,
  loadedAppointments,
  onChangeLangauge,
  setRating

}
class AppointmentsBloc
    extends  BlocBase {
Repository repository;
NetworkInfo networkInfo;
AppointmentsBloc({@required this.repository, @required this.networkInfo}) {
    repository = sl<Repository>();
    networkInfo = sl<NetworkInfo>();
  }
  final BehaviorSubject<EnterModel> _enterModelController =
  BehaviorSubject<EnterModel>();

  getEnterModel({String locale}) {
    final response = repository.handleGetEnterModel(locale: locale);
    _enterModelController.sink.add(response);
  }
saveToken({String locale,   Map<String, dynamic>  parameters}) {
  repository.saveDeviceRegId(locale: locale,parameters: parameters);
}
  //----------------------------------------------------------------------------
  //--------------------------First Enter Widgets-------------------------------
  final _uiActionsController = BehaviorSubject<UiAction>();
  final _actionsController = BehaviorSubject<UiAction>();
  Stream<UiAction> get getUiActions => _uiActionsController.stream;
  Stream<UiAction> get getPageInexUiActions => _actionsController.stream;

//==============================================================================
//==============================================================================
getPatientAppointments({user_id,locale}){
  _uiActionsController.sink.add(new UiAction(action: APPOINTMENT_ACTIONS.loadingAppointments.index));

  repository.handleGetPatientAppointments(user_id: user_id,locale: locale).then((value){
    print("getPatientAppointments in bloc value =${value.toString()}");

    _uiActionsController.sink.add(new UiAction(action: APPOINTMENT_ACTIONS.loadedAppointments.index,value: value));

  });
}
//==============================================================================
//==============================================================================

  setRating({Map<String, dynamic>  parameters,locale}){

    repository.handlePostRating(parameters: parameters,locale: locale).then((value){
      print("PostRating in bloc value =${value.toString()}");

      _uiActionsController.sink.add(new UiAction(action: APPOINTMENT_ACTIONS.setRating.index,value: value));

    });
  }
  @override
  void dispose() async{
    await _enterModelController.drain();
    _enterModelController?.close();
    await _actionsController.drain();
    _actionsController?.close();


  }
}
