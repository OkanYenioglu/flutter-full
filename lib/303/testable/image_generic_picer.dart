import 'package:flutter/material.dart';

class ImagePickerGeneric extends StatefulWidget {
  ImagePickerGeneric({Key? key}) : super(key: key);

  @override
  State<ImagePickerGeneric> createState() => _ImagePickerGenericState();
}

class _ImagePickerGenericState extends State<ImagePickerGeneric> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text('Fetch from gallery.')),
          ElevatedButton(onPressed: () {}, child: Text('a')),
          ElevatedButton(onPressed: () {}, child: Text('a')),
        ],
      ),
    );
  }
}
