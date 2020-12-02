
import 'package:flutterBoilerplateWithbloc/domain/entities/user_model/user_model_data.dart';
import 'package:flutter/cupertino.dart';

class EnterModel {
  bool is_loged_in;
  bool is_enter;
  var locale;
  var device_reg_id;
  UserModel userModel;

  EnterModel( {@required this.is_loged_in,@required this.is_enter,@required this.device_reg_id,@required this.locale:"ar",@required this.userModel,});

}
