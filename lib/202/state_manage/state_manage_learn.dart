import 'package:flutter/material.dart';
import 'package:flutter_full/202/state_manage/state_learn_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  StateManageLearnView({Key? key}) : super(key: key);

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.green,
        shadowColor: isVisible ? Colors.purple : Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isOpacity ? Colors.red : Colors.green,
        onPressed: () {
          changeOpacity();
          changeVisible();
        },
      ),
    );
  }
}
