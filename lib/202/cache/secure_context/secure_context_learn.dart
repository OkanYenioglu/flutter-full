import 'package:flutter/material.dart';
import 'package:flutter_full/202/cache/shared_learn_cache.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum _SecureKeys { token }

class SharedContextLearn extends StatefulWidget {
  const SharedContextLearn({Key? key}) : super(key: key);

  @override
  State<SharedContextLearn> createState() => _SharedContextLearnState();
}

class _SharedContextLearnState extends LoadingStatefull<SharedContextLearn> {
  final _storage = const FlutterSecureStorage();
  String _title = 'title';
  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    changeLoading();
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';
    if (_title.isNotEmpty) {
      print('Bu adam daha önce bu uygulamayı kullanmış ve token\'i bu $_title');
    }

    setState(() {});
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: TextField(
        onChanged: saveItems,
        minLines: 1,
        maxLines: 4,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Save'),
        onPressed: () {
          _storage.write(key: _SecureKeys.token.name, value: _title);
        },
      ),
    );
  }
}
