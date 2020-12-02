
import 'dart:io';

import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model_data.g.dart';

@JsonSerializable()
class UserModel extends Object with _$UserModelSerializerMixin {
    int id;
    String password;
    int user_type_id;
    String status;
    String serverToken;
    String errorDetailsMsg;
    String name;
    String email;
    String phone;
    bool isDoctor;
    String image_file_name;
    String city;
    int city_id;
    double lat;
    double long;
    double work_lat;
    double work_long;
    String address;
    String gender;
    String birth_day;
    String career;

    UserModel(
        {
            this.id,
            this.password,
            this.user_type_id,

//user
            this.status,
            this.serverToken,
            this.errorDetailsMsg,
            this.name,
            this.email,
            this.phone,
            this.isDoctor,
            this.image_file_name,
            this.city,
            this.city_id,
            this.address,
            this.gender,
            this.birth_day,
            this.career,
          this.work_lat,
          this.work_long,

            this.lat,
            this.long,



        });


 factory UserModel.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
