import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'http_client.dart';

class HttpClientImpl implements HttpClient {

  @override
   get(String url, {Map<String, dynamic> headers})  async {
    Dio client = new Dio();
    var uri = Uri.parse(url);

    Dio dio = new Dio();
    var response;
    try{
      response= await dio
          .get(uri.toString());
    }catch(e){
      print("HTTP DIO EXCEPTION ${e.toString()}");
    }

    return response.data;
//          .then((decoded) => print(decoded))
//          .catchError((error) => print("GET Exeption =\n${error.toString()}"));
  }

  @override
   post(String url, {Map<String, dynamic> headers}) async{
    final fromData=FormData.fromMap(headers);
    var uri = Uri.parse(url);
    Dio dio = new Dio();
    var response;
    response= await dio
        .post(uri.toString(),data:fromData );
    return response.data;

  }
}
