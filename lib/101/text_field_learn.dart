import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();

  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            maxLength: 20,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            inputFormatters: [TextProjectInputFormatter()._formFormatter],
            textInputAction: TextInputAction.next,
            focusNode: focusNodeTextFieldOne,
            buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
              return _animatedContainer(currentLength);
            },
            decoration: _InputDecorator()._textFieldInputDecoration,
          ),
          TextField(
            focusNode: focusNodeTextFieldTwo,
          )
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
      key: key,
      duration: const Duration(seconds: 1),
      height: 10,
      width: 10.0 * (currentLength ?? 0),
      color: Colors.green,
    );
  }
}

class TextProjectInputFormatter {
  final _formFormatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == "a") {
      return oldValue;
    } else {
      return oldValue;
    }
  });
}

class _InputDecorator {
  final _textFieldInputDecoration = const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    hintText: LanguageItems.textFieldLabel,
    labelText: LanguageItems.textFieldLabel,
  );
}
