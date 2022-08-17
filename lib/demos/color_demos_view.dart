// Bir ekran olacak
// Bu ekranda 3 button ve bunlara basınca renk değişimi olacak.
// Seçili olan buton selected icon olsun.

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  ColorDemos({Key? key, required this.initialColor}) : super(key: key);
  final Color? initialColor;
  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor;

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialColor != _backgroundColor && widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: _ColorContainer(color: _ColorUtility()._colorRed), label: _TextTitle()._labelTextRed),
          BottomNavigationBarItem(icon: _ColorContainer(color: _ColorUtility()._colorYellow), label: _TextTitle()._labelTextYellow),
          BottomNavigationBarItem(icon: _ColorContainer(color: _ColorUtility()._colorBlue), label: _TextTitle()._labelTextBlue),
        ],
        onTap: _colorOnTap,
      ),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(_ColorUtility()._colorRed);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(_ColorUtility()._colorYellow);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(_ColorUtility()._colorBlue);
    }
  }
}

enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 10,
      height: 10,
    );
  }
}

class _ColorUtility {
  final Color _colorRed = Colors.red;
  final Color _colorYellow = Colors.yellow;
  final Color _colorBlue = Colors.blue;
}

class _TextTitle {
  final String _labelTextRed = 'Red';
  final String _labelTextYellow = 'Yellow';
  final String _labelTextBlue = 'Blue';
}
