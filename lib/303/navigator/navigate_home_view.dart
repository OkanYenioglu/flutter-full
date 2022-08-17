import 'package:flutter/material.dart';
import 'package:flutter_full/303/navigator/navigator_manager.dart';
import 'package:flutter_full/product/mixin/navigator_mixin.dart';
import 'package:flutter_full/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  NavigateHomeView({Key? key}) : super(key: key);

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> with NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toString()),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.abc_rounded),
          onPressed: () async {
            await router.pushToPage(NavigateRoutes.detail, arguments: 'Okan');
            //await NavigatorManager.instance.pushToPage(NavigateRoutes.detail, arguments: 'Okan');
            //Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf, arguments: "abc");
          }),
    );
  }
}
