
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
enum MAIN_USER_ACTIONS {
  error,
  showToast,
  onLoadingUserData,
  onLoadedUserData,
  navigatePage,
}
class MainUserBloc
    extends BlocBase {
  Repository repository;
  NetworkInfo networkInfo;
  MainUserBloc({@required this.repository, @required this.networkInfo}) {
    repository = sl<Repository>();
    networkInfo = sl<NetworkInfo>();
  }

   final _mainPageActionsController = BehaviorSubject<UiAction>();

  Stream<UiAction> get getPageInexUiActions => _mainPageActionsController.stream;
  navigateToPage(int index) {
    _mainPageActionsController.sink
        .add(new UiAction(action: MAIN_USER_ACTIONS.navigatePage.index,pageIndex: index));
  }
  getUserData() {
    _mainPageActionsController.sink
        .add(new UiAction(action: MAIN_USER_ACTIONS.onLoadedUserData.index,value:repository.handleGetUserModel() ));
  }
  @override
  void dispose() async{
    await _mainPageActionsController.drain();
    _mainPageActionsController?.close();

  }
}
