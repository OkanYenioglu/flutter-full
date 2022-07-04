import 'package:flutter/material.dart';
import 'package:flutter_full/product/counter_hello_buton.dart';

class StatefullWidgetLearn extends StatefulWidget {
  const StatefullWidgetLearn({Key? key}) : super(key: key);

  @override
  State<StatefullWidgetLearn> createState() => _StatefullWidgetLearnState();
}

class _StatefullWidgetLearnState extends State<StatefullWidgetLearn> {
  int _countValue = 0;

  void incrementValue() {}

  void deincrementValue() {
    setState(() {
      _countValue -= 1;
    });
  }

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      _countValue += 1;
    } else {
      _countValue -= 1;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementFloatingActionButton(),
          _decreaseFloatingActionButton(),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              _countValue.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Placeholder(),
          CounterHelloButton(),
        ],
      ),
    );
  }

  FloatingActionButton _incrementFloatingActionButton() => FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: const Icon(Icons.add));

  Padding _decreaseFloatingActionButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: FloatingActionButton(
          onPressed: () {
            _updateCounter(false);
          },
          child: const Icon(Icons.remove)),
    );
  }
}
