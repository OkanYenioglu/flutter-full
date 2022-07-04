import 'package:flutter/material.dart';

class MyCollectionsDemo extends StatefulWidget {
  MyCollectionsDemo({Key? key}) : super(key: key);

  @override
  State<MyCollectionsDemo> createState() => _MyCollectionsDemoState();
}

class _MyCollectionsDemoState extends State<MyCollectionsDemo> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems()._items;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: PaddingUtility().paddingHorizantal,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _CategoryWidget(model: _items[index]);
        });
  }
}

class _CategoryWidget extends StatelessWidget {
  const _CategoryWidget({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: Padding(
        padding: PaddingUtility().paddingAll20,
        child: Column(
          children: [
            Image.asset(
              _model.imagePath,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: PaddingUtility().paddingTop,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_model.title),
                  Text("${_model.price} ETH"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollectionItems {
  late final List<CollectionModel> _items;
  CollectionItems() {
    _items = [
      CollectionModel(imagePath: ProjectImage.imageCollection, title: 'Abstract Art', price: 3.4),
      CollectionModel(imagePath: ProjectImage.imageCollection, title: 'Abstract Art', price: 3.4),
      CollectionModel(imagePath: ProjectImage.imageCollection, title: 'Abstract Art', price: 3.4),
    ];
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel({required this.imagePath, required this.title, required this.price});
}

class PaddingUtility {
  final paddingTop = const EdgeInsets.only(top: 10.0);
  final paddingBottom = const EdgeInsets.only(bottom: 20.0);
  final paddingAll20 = const EdgeInsets.all(20);
  final paddingHorizantal = const EdgeInsets.symmetric(horizontal: 20.0);
}

class ProjectImage {
  static const imageCollection = 'assets/png/image.png';
}
