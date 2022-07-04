import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  ImageLearn202({Key? key}) : super(key: key);

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ImagePaths.image.toWidget());
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
