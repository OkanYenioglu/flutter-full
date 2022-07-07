import 'package:dio/dio.dart';

class ProjectItems {
  static const String projectName = 'VB10';
}

class ProjectNetworkManager {
  ProjectNetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: 'pub.dev'));
  }

  late final Dio _dio;

  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get service => _dio;
}
