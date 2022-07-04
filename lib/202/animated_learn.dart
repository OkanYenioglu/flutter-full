import 'package:flutter/material.dart';

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({Key? key}) : super(key: key);

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: _AnimationDurations.durationLow);
  }

  bool _isVisible = false;
  bool _isOpacity = false;

  late AnimationController animationController;

  void changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _crossfadeWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeVisible();
          animationController.animateTo(_isVisible ? 1 : 0);
        },
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                child: const Text('data'), opacity: _isOpacity ? 1 : 0, duration: _AnimationDurations.durationLow),
            trailing: IconButton(
                onPressed: () {
                  changeOpacity();
                },
                icon: const Icon(Icons.precision_manufacturing)),
          ),
          AnimatedDefaultTextStyle(
              child: const Text('data'),
              style: (_isVisible ? context.textTheme().headline1 : context.textTheme().subtitle1) ?? const TextStyle(),
              duration: _AnimationDurations.durationLow),
          AnimatedIcon(icon: AnimatedIcons.ellipsis_search, progress: animationController),
          AnimatedContainer(
            color: _isVisible ? Colors.red : Colors.orange,
            duration: _AnimationDurations.durationLow,
            height: MediaQuery.of(context).size.height * (_isVisible ? 0.1 : 0.2),
            width: MediaQuery.of(context).size.width * (_isVisible ? 0.2 : 0.4),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                    top: _isVisible ? 100 : 10,
                    curve: Curves.elasticInOut,
                    child: const Text('data'),
                    duration: _AnimationDurations.durationLow)
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedCrossFade _crossfadeWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _AnimationDurations.durationLow,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _AnimationDurations {
  static const durationLow = Duration(seconds: 1);
}
