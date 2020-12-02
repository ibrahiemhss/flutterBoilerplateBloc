import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_helpers/bloc_event_state.dart';
import 'package:meta/meta.dart';

class DecisionState extends BlocState {
  DecisionState({
    this.enterModel,
    this.loading:true,
    this.dataEntry,
    this.isAuthenticated,
    this.isAuthenticating: false,
    this.hasFailed: false,
    this.name: '',
    this.locale

  });

  final EnterModel enterModel;
  final bool loading;
  final DataEntry dataEntry;
  final bool isAuthenticated;
  final bool isAuthenticating;
  final bool hasFailed;
  final String locale;
  final String name;


  //----------------------------------------------------------------------------
  //****************************************************************************
  //----------------------------------------------------------------------------
  factory DecisionState.LoadingData(bool loading,EnterModel _enterModel,DataEntry _dataEntry) {
    return DecisionState(
      loading: loading,
        enterModel: _enterModel,
      dataEntry: _dataEntry
    );
  }
//----------------------------------------------------------------------------
  //****************************************************************************
  //----------------------------------------------------------------------------
  factory DecisionState.ChangeLanguage(String locale) {
    return DecisionState(
        locale: locale,
    );
  }

  //----------------------------------------------------------------------------
  //****************************************************************************
  //----------------------------------------------------------------------------


  factory DecisionState.notAuthenticated() {
    return DecisionState(
      isAuthenticated: false,
    );
  }

  factory DecisionState.authenticated(String name) {
    return DecisionState(
      isAuthenticated: true,
      name: name,
    );
  }

  factory DecisionState.authenticating() {
    return DecisionState(
      isAuthenticated: false,
      isAuthenticating: true,
    );
  }

  factory DecisionState.failure() {
    return DecisionState(
      isAuthenticated: false,
      hasFailed: true,
    );
  }
}
