import 'package:flutter/material.dart';
import 'package:flutter_full/demos/password_text_field_learn.dart';

class ThemeLearnView extends StatefulWidget {
  ThemeLearnView({Key? key}) : super(key: key);

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const PasswordTextField(
            controller: null,
          ),
          CheckboxListTile(value: true, onChanged: (value) {}, title: const Text('Select')),
        ],
      ),
    );
  }
}
