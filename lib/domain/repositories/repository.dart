import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/user_model/user_model_data.dart';

abstract class Repository {
  void setFirstEnter();
  void saveDeviceRegId({String locale,   Map<String, dynamic>  parameters});
  UserModel handleGetCurrentUser();
  String handleGetLocaleLanguageSaved();

  Future<dynamic> handleUserSignIn(
      {
        String locale,
        Map<String, String> parameters});

  Future<dynamic> handleUserSignOut(
      {
        String locale,
        Map<String, dynamic>  parameters});
  Future<dynamic> handleSignUp(
      {
        String locale,
        Map<String, dynamic> parameters});
  Future<dynamic> handleSendPhone(
  {String phoneNumber, String locale,String country_code});
  Future<dynamic> handleCheckCode(
      {String code, String locale});
  Future<dynamic> handlePrivacyPolicy(
      { String locale});

  Future<bool> handleCheckUserSignedIn();
  Future<UserModel> handleGetCurrentLocalUser();
  Stream<UserModel> get currentUser;
  void setCurrentUser(UserModel user);

  Future<bool> initNotifications(String user_id);

  Future<bool> checkIfHaseIntenet();
  EnterModel handleGetEnterModel({String locale});
  UserModel handleGetUserModel();

  Future<DataEntry> handleGetDataEntry(String local);
  void handleChangeLanguage(String locale);
  Future<dynamic> handlePushNotfication({Map<String, String>  parameters,String locale});
  Future<dynamic> handleGetPatientAppointments({String user_id,String locale});
  Future<dynamic> handlePostRating({Map<String, dynamic>  parameters,locale});

}
