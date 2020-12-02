// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_data.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

UserModel _$UserFromJson(Map<String, dynamic> json) => new UserModel(
//==============================================================================
//===============TODO GENERAL USER INFO==========================================
//==============================================================================
      status: json[APIOperations.STATUS] == null
          ? null
          : json[APIOperations.STATUS] as String,
      //----------------------------------------
      errorDetailsMsg: json[APIOperations.ERROR_DETAILS_MESSAGE] == null
          ? null
          : json[APIOperations.ERROR_DETAILS_MESSAGE] as String,

//==============================================================================
//===============TODO GENERAL USER INFO==========================================
//==============================================================================

      id: json[APIOperations.ID] == null ? null : json[APIOperations.ID] as int,
      //----------------------------------------

      serverToken: json[APIOperations.SERVER_TOKEN] == null
          ? null
          : json[APIOperations.SERVER_TOKEN] as String,
      //----------------------------------------

      name: json[APIOperations.NAME] == null
          ? null
          : json[APIOperations.NAME] as String,
      //----------------------------------------

      email: json[APIOperations.EMAIL] == null
          ? null
          : json[APIOperations.EMAIL] as String,
      //----------------------------------------
      city: json[APIOperations.CITY] == null
          ? null
          : json[APIOperations.CITY] as String,
      //----------------------------------------
      //----------------------------------------
      city_id: json[APIOperations.CITY_ID] == null
          ? null
          : json[APIOperations.CITY_ID] as int,
      //----------------------------------------

      address: json[APIOperations.ADDRESS],
      //----------------------------------------

      gender: json[APIOperations.GENDER] == null
          ? null
          : json[APIOperations.GENDER] as String,
      //----------------------------------------

      phone: json[APIOperations.PHONE] == null
          ? null
          : json[APIOperations.PHONE] as String,
      //----------------------------------------

      isDoctor: json[APIOperations.IS_DOCTOR] == null
          ? null
          : json[APIOperations.IS_DOCTOR] as bool,
      //----------------------------------------

      birth_day: json[APIOperations.BIRTHDAY] == null
          ? null
          : json[APIOperations.BIRTHDAY] as String,
      //----------------------------------------

      career: json[APIOperations.CAREER] == null
          ? null
          : json[APIOperations.CAREER] as String,
      //----------------------------------------

      /*  email: json[APIOperations.EMAIL] == null
            ? null
            : json[APIOperations.EMAIL] as String,*/

      image_file_name: json[APIOperations.IMGE_URL] == null
          ? null
          : json[APIOperations.IMGE_URL] as String,

      //----------------------------------------
      user_type_id: json[APIOperations.USER_TYPE_ID] == null
          ? null
          : json[APIOperations.USER_TYPE_ID] as int,

      //----------------------------------------
      lat: json['lat'] == null ? null : json['lat'] as double,
      //----------------------------------------
      long: json['long'] == null ? null : json['long'] as double,
      //----------------------------------------
//==============================================================================
//===============TODO DOCTOR INFO===============================================
//==============================================================================


    );

abstract class _$UserModelSerializerMixin {
  int get id;

  String get password;

  String get status;

  String get serverToken;

  String get errorDetailsMsg;

  String get name;

  String get email;

  String get phone;

  bool get isDoctor;

  String get image_file_name;

  String get city;

  int get city_id;

  String get address;

  String get gender;

  String get birth_day;

  String get career;





/*  Map<String, dynamic> toJson() => <String, dynamic>{
    APIOperations.STATUS: status,
    APIOperations.ERROR_DETAILS_MESSAGE: errorDetailsMsg,
    APIOperations.USER: user,
    APIOperations.SERVER_TOKEN: serverToken,
    */ /* APIOperations.NAME: name,
        APIOperations.EMAIL: email,
        APIOperations.PHONE: phone,
        APIOperations.IMAGE_URL: image_file_name,
        APIOperations.CITY: city,
        APIOperations.ADDRESS: address,
        APIOperations.GENDER: gender,
        APIOperations.BIRTHDAY: birth_day,
        APIOperations.CAREER: career,*/ /*
  };*/

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'is_doctor': isDoctor,
        'img_url': image_file_name,
        'city': city,
        'address': address,
        'gender': gender,
        'birth_day': birth_day,
        'career': career,
        'city_id': city_id,
        'password': password,

      };
}
