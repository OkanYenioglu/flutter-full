import 'package:flutter/material.dart';
import 'package:flutter_full/product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  ImageLearn202({Key? key}) : super(key: key);

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.read<ResourceContext>().clear();
                },
                icon: const Icon(Icons.remove))
          ],
          title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? '0'),
        ),
        body: ImagePaths.image.toWidget());
  }
}

enum ImagePaths { image }

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget() {
    return Image.asset(path());
  }
}
