import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            ),
          ),
          Container(color: Colors.red, height: 300),
          Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.white, width: 150),
                Container(color: Colors.red, width: 150),
                Container(color: Colors.purple, width: 150),
              ],
            ),
          ),
          Divider(),
          Icon(Icons.close),

          // xxxx
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            ),
          ),
          Container(color: Colors.red, height: 300),
          Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.white, width: 150),
                Container(color: Colors.red, width: 150),
                Container(color: Colors.purple, width: 150),
              ],
            ),
          ),
          Divider(),
          Icon(Icons.close),
          _ListDemo(),
        ],
      ),
    );
  }
}

class _ListDemo extends StatefulWidget {
  const _ListDemo({Key? key}) : super(key: key);

  @override
  State<_ListDemo> createState() => __ListDemoState();
}

class __ListDemoState extends State<_ListDemo> {
  @override
  void initState() {
    super.initState();
    print('hello');
  }

  @override
  void dispose() {
    super.dispose();
    print('bye');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
