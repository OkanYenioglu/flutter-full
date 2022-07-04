import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_full/303/reqrest_resource/model/resource_model.dart';
import 'package:flutter_full/303/reqrest_resource/viewModel/reqres_view_model.dart';
import 'package:flutter_full/product/extension/string_extension.dart';

class ReqresView extends StatefulWidget {
  ReqresView({Key? key}) : super(key: key);

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: isLoading ? CircularProgressIndicator() : null),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (BuildContext context, int index) {
          inspect(resources[index]);
          return Card(color: Color(resources[index].color?.colorValue ?? 0), child: Text(resources[index].name ?? ''));
        },
      ),
    );
  }
}
