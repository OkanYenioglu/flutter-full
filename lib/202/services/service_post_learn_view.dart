import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full/202/services/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  ServicePostLearn({Key? key}) : super(key: key);
  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseURL = 'https://jsonplaceholder.typicode.com/';
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    _dio = Dio(BaseOptions(baseUrl: _baseURL));
    super.initState();
    name = 'Okan';
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel);

    if (response.statusCode == HttpStatus.created) {
      name = 'Başarılı';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name ?? ''),
          actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
        ),
        body: Column(
          children: [
            TextField(
                controller: _titleController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Title')),
            TextField(
                controller: _bodyController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Body')),
            TextField(
                controller: _userIdController,
                keyboardType: TextInputType.phone,
                autofillHints: [AutofillHints.creditCardNumber],
                decoration: InputDecoration(labelText: 'UserId')),
            TextButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_titleController.text.isNotEmpty &&
                            _bodyController.text.isNotEmpty &&
                            _userIdController.text.isNotEmpty) {
                          final model = PostModel(
                              body: _bodyController.text,
                              title: _titleController.text,
                              userId: int.tryParse(_userIdController.text));

                          _addItemToService(model);
                        }
                      },
                child: const Text('Send')),
          ],
        ));
  }
}

class _postCard extends StatelessWidget {
  const _postCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
