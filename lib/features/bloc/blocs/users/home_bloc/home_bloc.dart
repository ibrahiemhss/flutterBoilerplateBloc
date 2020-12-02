import 'dart:async';
import 'package:flutterBoilerplateWithbloc/core/util/redirect.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/user_model/user_model_data.dart';
import 'package:flutterBoilerplateWithbloc/domain/repositories/repository.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_event_state.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../injection_container.dart';
import 'home_event.dart';
import 'home_state.dart';

enum HOME_ACTIONS {
  clearTextEditingController,
  error,
  noInternet,
  showToast,
  clickSeach,
  undoClickSeach,
  loadingSearch,
  actionSearch,
  undoActionSearch,
  doneLoadedSearch,
  loadingMore,
  doneLoadedMore,
  selectSpecialty,
  undoSelectSpecialty,
  selectProvince,
  undoSelectProvince,
  selectTypeOfService,
  undoSelectTypeOfService,
  selectPrice,
  undoSelectPrice,
  selectBookingDay,
  undoSelectBookingDay,
  loadingDoctorDetails,
  loadedDoctorDetails,
}

class HomeBloc extends BlocEventStateBase<HomeEvent, HomeState> {
  HomeBloc({this.repository})
      : super(
          initialState: HomeState.noAction(),
        ) {
    repository == sl<Repository>();
  }

//==============================================================================
//==============================================================================
  Repository repository;
  final _uiActionsController = BehaviorSubject<UiAction>();
  Stream<UiAction> get getUiActions => _uiActionsController.stream;

//==============================================================================
//==============================================================================
  @override
  Stream<HomeState> eventHandler(
      HomeEvent event, HomeState currentState) async* {
    Timer _timer;
    int sceond = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      sceond++;
    });
    print("Home bloc Start Loading .............${sceond.toString()}");


    if (event is HomeCheckInternetEvent) {
      bool isInternet = await repository.checkIfHaseIntenet();

      yield HomeState.noInternet(isInternet);
    } else if (event is HomeLoadSearchEvent) {
      print("MainUserSearchEvent");
      yield HomeState.loadingSearch();

      //await Future.delayed(Duration(seconds: 1));

      print("Home bloc Start Search  .............${sceond.toString()}");
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.loadingSearch.index));
      if (event.searchValue == "") {
        _uiActionsController.sink
            .add(new UiAction(action: HOME_ACTIONS.showToast.index));
      }


      /*.then((onVlaue) {
          if (onVlaue != null) {
            MainUserSearch=onVlaue;
            //_MainSearchItemsController.sink.add(onVlaue);
          };
        });*/
      // await Future.delayed(Duration(seconds: 1));

      // yield HomeState.laodedSearch(MainUserSearch);

    }
  }

//==============================================================================
//==============================================================================
  void gooDetails({
    @required HomeBloc bloc,
    @required EnterModel enterModel,
    @required UserModel userModel,

    @required DataEntry dataEntry,
    @required BuildContext context,
    @required bool isLogedIn,
  }) {
    /*Redirect.toPage(
        context,
      // TODO add next page after log in
    ));*/
    //_uiActionsController.sink.add(new UiAction(action: PHONEBOOK_ACTIONS.gooDetails.index,value: doctorPhonebook));
  }

//==============================================================================
//==============================================================================
  executeSearch(HomeLoadSearchEvent event) {
    Timer _timer;
    int sceond = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      sceond++;
    });
    print("Home bloc Start Search  .............${sceond.toString()}");
    _uiActionsController.sink
        .add(new UiAction(action: HOME_ACTIONS.loadingSearch.index));
    if (event.searchValue.isEmpty) {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.showToast.index));
    }


    _timer?.cancel();
  }

//==============================================================================
//==============================================================================
  void onClickleSearch(
      {@required bool clickSearch, @required bool actionSearch}) {
    if (actionSearch) {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.actionSearch.index));
    } else {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.undoActionSearch.index));
    }

    if (clickSearch) {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.clickSeach.index));
    } else {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.undoClickSeach.index));
    }
  }

//==============================================================================
//==============================================================================
  void onSelectSpecialty({@required bool selected}) {
    // type: 0 = text, 1 = image, 2 = sticker
    if (selected) {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.undoSelectSpecialty.index));
    } else {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.selectSpecialty.index));
    }
  }

//==============================================================================
//==============================================================================
  void onSelectProvince({@required bool selected}) {
    // type: 0 = text, 1 = image, 2 = sticker
    if (selected) {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.undoSelectProvince.index));
    } else {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.selectProvince.index));
    }
  }

//==============================================================================
//==============================================================================
  void onSelectTypeOfService({@required bool selected}) {
    // type: 0 = text, 1 = image, 2 = sticker
    if (!selected) {
      _uiActionsController.sink.add(
          new UiAction(action: HOME_ACTIONS.undoSelectTypeOfService.index));
    } else {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.selectTypeOfService.index));
    }
  }

//==============================================================================
//==============================================================================
  void onSelectPrice({@required bool selected}) {
    if (!selected) {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.undoSelectPrice.index));
    } else {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.selectPrice.index));
    }
  }

//==============================================================================
//==============================================================================
  void onSelectBookingDay({@required bool selected}) {
    if (!selected) {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.undoSelectBookingDay.index));
    } else {
      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.selectBookingDay.index));
    }
  }

//==============================================================================
//==============================================================================
   getDoctorDetails(
      {@required String locale,
      @required String dr_id,
      @required String request_date}) async {
    _uiActionsController.sink
        .add(new UiAction(action: HOME_ACTIONS.loadingDoctorDetails.index));

    bool checkInternet = await repository.checkIfHaseIntenet();
    if (!checkInternet) {

      _uiActionsController.sink
          .add(new UiAction(action: HOME_ACTIONS.noInternet.index));
    }else{

    }
  }

  @override
  void dispose() async {

    await _uiActionsController.drain();
    _uiActionsController.close();

  }
}
