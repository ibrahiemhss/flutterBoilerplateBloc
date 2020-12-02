import 'dart:convert';
import 'dart:ui';

import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/locale_helper.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/user_model/user_model_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  void setFirstEnter();
  void saveDeviceRegId(String token);
  EnterModel getEnterModelValues({String locale});
  String getLocaleLang();
  void setLanaguage(String locale);

  UserModel getUserData();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  //final AppDatabase appDatabase;
  LocalDataSourceImpl({this.sharedPreferences, this.appDatabase});

  //----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
  @override
  String getLocaleLang() {
    return sharedPreferences.getString(SharedPreferenceKeys.LOCAL_LANGUAGE) ??
        "ar";
  }


  @override
  void setFirstEnter() {
    sharedPreferences.setBool(SharedPreferenceKeys.IS_FIRST_ENTER, false);
  }

  EnterModel getEnterModelValues({String locale}) {
    String _usr;
    String _token;
    bool _is_loged_in;
    bool _is_enter;

    try {
      _usr = sharedPreferences.getString(SharedPreferenceKeys.USER) ?? null;
      _token =
          sharedPreferences.getString(SharedPreferenceKeys.SERVER_TOKEN_ID) ??
              "null";
      _is_enter =
          sharedPreferences.getBool(SharedPreferenceKeys.IS_FIRST_ENTER) ??
              true;
      locale =
          sharedPreferences.getString(SharedPreferenceKeys.LOCAL_LANGUAGE) ??
              "ar";
      _is_loged_in =
          sharedPreferences.getBool(SharedPreferenceKeys.IS_USER_LOGGED_IN) ??
              false;


      print(
          "\n============================token When getValue ======================"
          " \n${    sharedPreferences.getString(SharedPreferenceKeys.SERVER_TOKEN_ID)??"null"
          }\n"
          "=====================================================================");
    } catch (e) {
      print("shared enter exception ${e.toString()}");
      return EnterModel(
        userModel: _usr == null ? null : UserModel.fromJson(json.decode(_usr)),
        is_loged_in: _is_loged_in,
        locale: locale??"ar",
        device_reg_id: sharedPreferences.getString(SharedPreferenceKeys.SERVER_TOKEN_ID)??"null",
        is_enter: _is_enter,
      );
    }
    return EnterModel(
            userModel:
                _usr == null ? null : UserModel.fromJson(json.decode(_usr)),
            //--------------------------------------------------------------------
            is_loged_in: _is_loged_in,
            //--------------------------------------------------------------------
            locale: locale,
            //--------------------------------------------------------------------
            is_enter: _is_enter,
          device_reg_id: sharedPreferences.getString(SharedPreferenceKeys.SERVER_TOKEN_ID)??"null",
    ) ??
        null;
  }
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
  @override
  void saveDeviceRegId(String token) async {
    sharedPreferences.setString(SharedPreferenceKeys.SERVER_TOKEN_ID, token);
    print(
        "\n============================token When Saved ========================"
        " \n$token\n"
        "=====================================================================");
  }



  @override
  void setLanaguage(String locale) {
    print("changed language =${locale}");
    helper.onLocaleChanged(new Locale(locale));
    sharedPreferences.setString(SharedPreferenceKeys.LOCAL_LANGUAGE,locale);
  }

  @override
  UserModel getUserData() {
    String _usr = sharedPreferences.getString(SharedPreferenceKeys.USER) ?? null;
    return UserModel.fromJson(json.decode(_usr));
  }


}
