import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Redirect{
  static void toPage(BuildContext context, Widget page){
    WidgetsBinding.instance.addPostFrameCallback((_){
      MaterialPageRoute newRoute = MaterialPageRoute(
          builder: (BuildContext context) => page
      );

      Navigator.of(context).pushAndRemoveUntil(newRoute, ModalRoute.withName('/decision'));
    });
  }
}