import 'dart:io';

import 'package:flutterBoilerplateWithbloc/features/common_widgets/goo_settings_dailog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class GetImageFile {

  static Future<File> pickImage(BuildContext context) async {
    File imageFile;
    try{


    if (listenForPermissionStatus != null) {
      if (listenForPermissionStatus == true) {
        imageFile = await ImagePicker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 450.0,
          maxWidth: 450.0,
          imageQuality: 50,
        );
      } else {
        imageFile = await ImagePicker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 450.0,
          maxWidth: 450.0,
          imageQuality: 50,
        );
        if(listenForPermissionStatus == false){
          showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return SettingDialog(
                    "لكى تتمكن من ارسال الصور من فضلك قم بالسماح للتطبيق باستخدام مكتبة الصور اضغد ذهاب الى الاعدادت ادناه لكي تتمكن من ذلك"
                    , () {
                  Navigator.pop(context, false);
                });
              });
        }


      }
    }
    }catch (Exception){
      showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return SettingDialog(
                "لكى تتمكن من ارسال الصور من فضلك قم بالسماح للتطبيق باستخدام مكتبة الصور اضغد ذهاب الى الاعدادت ادناه لكي تتمكن من ذلك"
                , () {
              Navigator.pop(context, false);
            });
          });
    }
    return imageFile;
  }
 static bool listenForPermissionStatus() {
   bool _permission = false;
   PermissionStatus _permissionStatus = PermissionStatus.unknown;
   Future<PermissionStatus> status = PermissionHandler()
       .checkPermissionStatus(PermissionGroup.mediaLibrary);
   status.then((PermissionStatus status) async{
       _permissionStatus=status;
     if(_permissionStatus == PermissionStatus.granted) {
       _permission =true;
     }else{
       _permission= false;
     }
   });

   return _permission;
 }
}

