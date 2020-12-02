
import 'dart:async';

import 'package:flutterBoilerplateWithbloc/core/http/network_info.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/repositories/repository.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_event_state.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_provider.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../injection_container.dart';
enum FEILD_ACTIONS {
  onChange,
}
class TextFeildBloc
    extends BlocBase {


  final _actionsController = BehaviorSubject<UiAction>();

  Stream<UiAction> get getUiActions => _actionsController.stream;

  onChange(text) {
    _actionsController.sink
        .add(new UiAction(action: FEILD_ACTIONS.onChange.index,value:text));
  }



  @override
  void dispose() async{
    await _actionsController.drain();
    _actionsController?.close();

  }
}
