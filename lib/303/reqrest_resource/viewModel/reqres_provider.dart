import 'package:flutter/material.dart';
import 'package:flutter_full/product/global/resource_context.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';
import '../service/reqres_service.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqresService reqresService;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqResProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocal(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
