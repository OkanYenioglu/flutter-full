import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _CustomCard(
            child: SizedBox(
              height: 100,
              width: 100,
            ),
          ),
          _CustomCard(
            child: SizedBox(
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}

// Borders
// StadiumBorder(), CircleBorder(), RoundedRectangleBorder()

class _CustomCard extends StatelessWidget {
  final Widget child;

  const _CustomCard({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMargin,
      color: Colors.white,
      elevation: 10,
      child: child,
    );
  }
}
