import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<dynamic> get(String url, {Map<String, dynamic> headers});
  Future<dynamic> post(String url, {Map<String, dynamic> headers});
}
