import 'package:flutter/material.dart';
import 'package:flutter_full/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);
  final _cardHeight = 50.0;
  final _cardWidth = 200.0;
  final _cardBottomPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(child: const RandomImage(), bottom: _cardHeight / 2),
                Positioned(height: _cardHeight, bottom: _cardBottomPosition, width: _cardWidth, child: _customCard())
              ],
            ),
          ),
          const Spacer(
            flex: 7,
          )
        ],
      ),
    );
  }

  Card _customCard() {
    return const Card(
      shape: RoundedRectangleBorder(),
      color: Colors.white,
    );
  }
}
