import 'package:flutter/material.dart';
import 'package:flutter_full/202/oop_learn.dart';

class OopLearnView extends StatefulWidget {
  OopLearnView({Key? key}) : super(key: key);

  @override
  State<OopLearnView> createState() => _OopLearnViewState();
}

class _OopLearnViewState extends State<OopLearnView> {
  FileDownload? download;

  @override
  void initState() {
    super.initState();

    download = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          download?.downloadItem(null);
        },
      ),
    );
  }
}
