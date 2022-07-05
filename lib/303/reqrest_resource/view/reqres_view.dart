import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full/202/image_learn_202.dart';
import 'package:flutter_full/303/reqrest_resource/model/resource_model.dart';
import 'package:flutter_full/303/reqrest_resource/service/reqres_service.dart';
import 'package:flutter_full/303/reqrest_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full/303/reqrest_resource/viewModel/reqres_view_model.dart';
import 'package:flutter_full/product/extension/string_extension.dart';
import 'package:flutter_full/product/global/resource_context.dart';
import 'package:flutter_full/product/global/theme_notifier.dart';
import 'package:flutter_full/product/service/project_dio.dart';
import 'package:provider/provider.dart';

class ReqresView extends StatefulWidget {
  ReqresView({Key? key}) : super(key: key);

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

//class _ReqresViewState extends ReqresViewModel {
class _ReqresViewState extends State<ReqresView> with ProjectDioMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProvider>(
      create: (context) => ReqResProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
          appBar: AppBar(
              actions: [_SaveAndNavigateWidget()],
              title: context.watch<ReqResProvider>().isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : null),
          body: Column(
            children: [
              _TempPlaceHolder(),
              Expanded(child: _resourceListView(context, context.watch<ReqResProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: context.watch<ReqResProvider>().resources.length,
      itemBuilder: (BuildContext context, int index) {
        inspect(context.watch<ReqResProvider>().resources[index]);
        return Card(
            color: Color(context.watch<ReqResProvider>().resources[index].color?.colorValue ?? 0),
            child: Text(context.watch<ReqResProvider>().resources[index].name ?? ''));
      },
    );
  }
}

class _SaveAndNavigateWidget extends StatelessWidget {
  const _SaveAndNavigateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<ReqResProvider>().saveToLocal(context.read<ResourceContext>());
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return ImageLearn202();
          }));
        },
        child: Icon(Icons.ac_unit_outlined));
  }
}

class _TempPlaceHolder extends StatelessWidget {
  const _TempPlaceHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ReqResProvider, bool>(builder: (context, value, child) {
      return value ? const Placeholder() : const Text('data');
    }, selector: (context, provider) {
      return provider.isLoading;
    });
  }
}
