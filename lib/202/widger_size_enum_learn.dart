import 'package:flutter/material.dart';

class WidgetSizeEnumLearnView extends StatefulWidget {
  WidgetSizeEnumLearnView({Key? key}) : super(key: key);

  @override
  State<WidgetSizeEnumLearnView> createState() => _WidgetSizeEnumLearnViewState();
}

class _WidgetSizeEnumLearnViewState extends State<WidgetSizeEnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Card(
          child: Container(
            height: WidgetSizes.normalCardHeight.value(),
          ),
        ));
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWidth }

extension WidgetSizeExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 30.0;
      case WidgetSizes.circleProfileWidth:
        return 25.0;
    }
  }
}
