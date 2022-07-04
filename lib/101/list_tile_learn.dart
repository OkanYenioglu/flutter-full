import 'package:flutter/material.dart';
import 'package:flutter_full/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const RandomImage(),
                subtitle: const Text("How dou you use your card ?"),
                leading: const Icon(Icons.money),
                trailing: const Icon(Icons.chevron_right_sharp),
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
