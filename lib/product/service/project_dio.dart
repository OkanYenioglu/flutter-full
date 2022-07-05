import 'package:dio/dio.dart';

class ProjectDioMixin {
  Dio service = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
}

class demo {}
