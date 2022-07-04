import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full/202/cache/shared_learn_cache.dart';
import 'package:flutter_full/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_full/product/service/project_dio.dart';

import '../model/resource_model.dart';
import '../view/reqres_view.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqresView> with ProjectDio {
  late final IReqresService reqresService;
  List<Data> resources = [];
  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}