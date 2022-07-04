import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full/202/services/commands_learn_view.dart';
import 'package:flutter_full/202/services/post_model.dart';
import 'package:flutter_full/202/services/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);
  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  String? name;
  bool _isLoading = false;
  late final Dio _dio;

  final _baseURL = 'https://jsonplaceholder.typicode.com/';

// TEST EDİLEBİLİR KOD BAŞLADI
  late final IPostService _postService;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    _dio = Dio(BaseOptions(baseUrl: _baseURL));
    _postService = PostService();
    super.initState();
    name = 'Okan';
    fetchPostItemsAdvance();
  }

  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [_isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return _postCard(model: _items?[index]);
        },
      ),
    );
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
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommentsLearnView(
                    postId: _model?.id,
                  )));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
