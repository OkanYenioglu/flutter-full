import 'package:flutter/material.dart';

part './part_appbar.dart';

class PartOfLearn extends StatefulWidget {
  const PartOfLearn({Key? key}) : super(key: key);

  @override
  State<PartOfLearn> createState() => _PartOfLearnState();
}

class _PartOfLearnState extends State<PartOfLearn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _PartofAppBar(),
    );
  }
}
