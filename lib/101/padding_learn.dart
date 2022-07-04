import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: ProjectPadding.pagePaddingVertical +
                ProjectPadding.pagePaddingRightOnly,
            child: Container(
              color: Colors.white,
              width: 200,
            ),
          ),
          Container(
            color: Colors.white,
            height: 100,
            width: 200,
          ),
        ],
      ),
    );
  }
}

class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);

  static const pagePaddingRightOnly = EdgeInsets.only(right: 20);
}
