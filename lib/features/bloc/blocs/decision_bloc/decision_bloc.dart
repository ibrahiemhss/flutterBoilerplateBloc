
import 'dart:async';

import 'package:flutterBoilerplateWithbloc/core/http/network_info.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/fcm_notification_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/repositories/repository.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_event_state.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../injection_container.dart';
import 'decision_event.dart';
import 'decision_state.dart';
enum DESISION_ACTIONS {
  error,
  showToast,
  showFcmDialog,
  navigatePage,
  navigateToItemDetail,
  loadingLists,
  loadedLists,
  onChangeLangauge,

}
class DecisionBloc
    extends BlocEventStateBase<DecisionEvent, DecisionState> {
  Repository repository;
  NetworkInfo networkInfo;
  DecisionBloc({@required this.repository, @required this.networkInfo}) {
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
  final _pageInexActionsController = BehaviorSubject<UiAction>();
  Stream<UiAction> get getUiActions => _uiActionsController.stream;
  Stream<UiAction> get getPageInexUiActions => _pageInexActionsController.stream;

  setFirstEnter() {
    repository.setFirstEnter();
  }
  changeLanguage(Locale locale) {
    _uiActionsController.sink
        .add(new UiAction(action: DESISION_ACTIONS.onChangeLangauge.index,value:locale));
  }
  showFcmDialog(FcmNotificationModel fcmNotification) {
    _uiActionsController.sink
        .add(new UiAction(action: DESISION_ACTIONS.showFcmDialog.index,value:fcmNotification));
  }
  navigateToPage(int index) {
    _uiActionsController.sink
        .add(new UiAction(action: DESISION_ACTIONS.navigateToItemDetail.index,pageIndex: index));
  }
  navigateToItemDetail(FcmNotificationModel fcmNotification) {
    _pageInexActionsController.sink
        .add(new UiAction(action: DESISION_ACTIONS.navigateToItemDetail.index,value:fcmNotification));
  }
  BehaviorSubject<EnterModel> get enterModelValueController =>
      _enterModelController;

  //----------------------------------------------------------------------------
  //--------------------------Main Page Widgets---------------------------------
  final BehaviorSubject<DataEntry> _dataEntryController =
  BehaviorSubject<DataEntry>();
  BehaviorSubject<DataEntry> get dataEntryValueController =>
      _dataEntryController;

  getDataEntry(String local) {
    _uiActionsController.sink
        .add(new UiAction(action: DESISION_ACTIONS.loadingLists.index));

    repository.handleGetDataEntry(local).then((onVlaue) {
      Timer _timer;
      int sceond = 0;
      _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        sceond++;
      });
      print("Main bloc Start Loading .............${sceond.toString()}");

      if (onVlaue != null) {
        _dataEntryController.sink.add(onVlaue);
        _uiActionsController.sink
            .add(new UiAction(action: DESISION_ACTIONS.loadedLists.index));

        print("Main bloc Done Loaded Data  after ${sceond.toString()} Second");
        _timer?.cancel();
      }
      ;
    });
  }


  @override
  void dispose() async{
    await _enterModelController.drain();
    _enterModelController?.close();
    await enterModelValueController.drain();
    enterModelValueController?.close();
    await _uiActionsController.drain();
    _uiActionsController?.close();
    await _dataEntryController.drain();
    _dataEntryController?.close();
    await dataEntryValueController.drain();
    dataEntryValueController?.close();

    await _pageInexActionsController.drain();
    _pageInexActionsController?.close();

  }

  @override
  Stream<DecisionState> eventHandler(DecisionEvent event, DecisionState currentState) async* {
    EnterModel _enterModel = null;
    DataEntry _dataEntry = null;
    if (event is DecisionEventChangeLoanuage) {
        yield DecisionState.ChangeLanguage(event.locale);
    }else
    if (event is DecisionEventLoad) {
      _enterModel = repository.handleGetEnterModel(locale: event.locale);
      _dataEntry = await repository.handleGetDataEntry(event.locale);

      if (_enterModel != null && _dataEntry !=null) {
        yield DecisionState.LoadingData(false, _enterModel,_dataEntry);
      } else {
        yield DecisionState.LoadingData(true,  null,null);
      }
    }
  }
}
