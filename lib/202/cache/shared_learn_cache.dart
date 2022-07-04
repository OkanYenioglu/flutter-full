import 'package:flutter/material.dart';
import 'package:flutter_full/202/cache/shared_manager.dart';
import 'package:flutter_full/202/cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  SharedLearn({Key? key}) : super(key: key);

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentValue.toString(),
        ),
        actions: [_loading(context)],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [_saveValueButton(), _removeValueButton()],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
              _removeValueButton();
            },
          ),
          Expanded(
            child: _UserListView(),
          )
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _loading(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          )
        : SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.save_outlined),
      onPressed: () async {
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove_outlined),
      onPressed: () async {
        changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      },
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({
    Key? key,
  }) : super(key: key);

  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name ?? ''),
            subtitle: Text(users[index].description ?? ''),
            trailing: Text(users[index].url ?? '',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(decoration: TextDecoration.underline)),
          ),
        );
      },
    );
  }
}

class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User('okan', '101', 'okan.com'),
      User('okan2', '102', 'okan.com'),
      User('okan3', '103', 'okan.com'),
      User('okan4', '104', 'okan.com'),
    ];
  }
}

// Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
