import 'package:flutter/material.dart';
import 'package:flutter_full/product/widget/button/answer_button.dart';
import 'package:flutter_full/product/widget/button/loading_button.dart';

import '../product/widget/callback_dropdown.dart';

class CallbackLearn extends StatefulWidget {
  const CallbackLearn({super.key});

  @override
  State<CallbackLearn> createState() => _CallbackLearnState();
}

class _CallbackLearnState extends State<CallbackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallbackDropdown(
            onUserSelected: (CallbackUser user) {
              print(user.name);
            },
          ),
          AnswerButton(
            onNumber: (number) {
              print(number);
              return number % 3 == 1;
            },
          ),
          LoadingButton(
            title: 'Save',
            onPressed: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
          )
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);

  //TODO:Dummy Code Remove it.
  static List<CallbackUser> dummyUsers() {
    return [CallbackUser('vb', 123), CallbackUser('vb1', 1234)];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallbackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
