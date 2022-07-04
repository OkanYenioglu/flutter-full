import 'package:dio/dio.dart';

class ProjectDio {
  Dio service = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
}

class demo {}
