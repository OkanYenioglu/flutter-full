import 'package:flutter/material.dart';

class MobxImageUpload extends StatefulWidget {
  MobxImageUpload({Key? key}) : super(key: key);

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Upload'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Card(
              elevation: 10,
              child: FittedBox(
                  child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.upload_file),
              )),
            ),
          ),
          Divider(),
          const Spacer(
            flex: 4,
          )
        ],
      ),
    );
  }
}
