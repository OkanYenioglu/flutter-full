import 'package:flutter/material.dart';

import '../../303/callback_learn.dart';

class CallbackDropdown extends StatefulWidget {
  const CallbackDropdown({super.key, required this.onUserSelected});

  final void Function(CallbackUser user) onUserSelected;
  @override
  State<CallbackDropdown> createState() => _CallbackDropdownState();
}

class _CallbackDropdownState extends State<CallbackDropdown> {
  CallbackUser? _user;

  void _updateUser(CallbackUser? item) {
    setState(() {
      _user = item;
    });

    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallbackUser>(
      value: _user,
      items: CallbackUser.dummyUsers()
          .map((e) => DropdownMenuItem(
                child: Text(
                  e.name,
                  style: Theme.of(context).textTheme.headline3,
                ),
                value: e,
              ))
          .toList(),
      onChanged: _updateUser,
    );
  }
}
