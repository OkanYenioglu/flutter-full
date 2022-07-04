import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        onChanged: () {
          print('a');
        },
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            _TextFormFieldNotEmpty(),
            _TextFormFieldNotEmpty(),
            DropdownButtonFormField<String>(
                validator: FormFieldValidator().isNotEmpty,
                items: const [
                  DropdownMenuItem(child: Text('a'), value: 'v'),
                  DropdownMenuItem(child: Text('b'), value: 'v1'),
                  DropdownMenuItem(child: Text('c'), value: 'v2'),
                ],
                onChanged: (value) {}),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {}
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }

  TextFormField _TextFormFieldNotEmpty() {
    return TextFormField(
      validator: (value) {
        return FormFieldValidator().isNotEmpty(value);
      },
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorClassTexts._validatorTextNotEmpty;
  }
}

class ValidatorClassTexts {
  static const String _validatorTextNotEmpty = 'Bu alan boş bırakılamaz.';
}
