import 'package:flutter/material.dart';

import 'package:flutter_full/202/package/loading_bar.dart';

import 'package/launch_mixin.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        launchUrl('https://pub.dev/packages/url_launcher');
      }),
      body: const LoadingBar(),
    );
  }

  @override
  void name() {
    // TODO: implement name
  }
}
