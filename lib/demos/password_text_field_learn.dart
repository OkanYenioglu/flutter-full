import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscureText = '#';

  bool _isSecure = true;

  void _changeSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure,
      obscuringCharacter: _obscureText,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: _PasswordTextFieldText()._passwordText,
        labelText: _PasswordTextFieldText()._passwordText,
        suffix: _onVisibilityMethod(),
      ),
    );
  }

  IconButton _onVisibilityMethod() {
    return IconButton(
      onPressed: () {
        _changeSecure();
      },
      icon: AnimatedCrossFade(
          firstChild: const Icon(Icons.visibility_outlined),
          secondChild: const Icon(Icons.visibility_off_outlined),
          crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: _PasswordTextViewCrossFadeDuration()),
      // icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off),
    );
  }

  Duration _PasswordTextViewCrossFadeDuration() => const Duration(milliseconds: 500);
}

class _PasswordTextFieldText {
  final String _passwordText = 'Password';
}
