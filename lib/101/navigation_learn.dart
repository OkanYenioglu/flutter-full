import 'package:flutter/material.dart';
import 'package:flutter_full/demos/my_collections_demo.dart';

import 'image_learn.dart';
import 'navigate_detail_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems = [];

  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return TextButton(
          onPressed: () async {
            final response = await navigateToWidgetNormal<bool>(context, NavigateDetailLearnDart(isOkay: selectedItems.contains(index)));

            if (response is bool) {
              addSelected(index, response);
            }
          },
          child: Padding(
            padding: PaddingUtility().paddingAll20,
            child: Placeholder(
              color: selectedItems.contains(index) ? Colors.green : Colors.red,
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigation_rounded),
        onPressed: () async {},
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) {
            return widget;
          },
          fullscreenDialog: true,
          settings: const RouteSettings()),
    );
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
          builder: (context) {
            return widget;
          },
          fullscreenDialog: true,
          settings: const RouteSettings()),
    );
  }
}
