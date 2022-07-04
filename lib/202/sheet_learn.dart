import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full/101/list_view_learn.dart';
import 'package:flutter_full/202/image_learn_202.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({Key? key}) : super(key: key);

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      body: Center(
          child: TextButton(
              onPressed: () {
                showCustomSheet(context, ListViewLearn());
              },
              child: const Text('Show'))),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              context: context,
              builder: (context) {
                return _CustomSheet(backgroundColor: _backgroundColor);
              });

          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.cyan;
            });
          }
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    Key? key,
    required Color backgroundColor,
  }) : super(key: key);

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.white;
  final _gridHeight = 24.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: PaddingManager.normalPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _gridHeight,
              child: Stack(children: [
                Divider(
                  color: Theme.of(context).copyWith().colorScheme.onBackground,
                  thickness: 3,
                  indent: MediaQuery.of(context).size.width * 0.45,
                  endIndent: MediaQuery.of(context).size.width * 0.45,
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.03,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.close),
                  ),
                )
              ]),
            ),
            const Text('data'),
            Image.network('https://picsum.photos/200', fit: BoxFit.cover),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _backgroundColor = Colors.purple;
                  });
                  Navigator.of(context).pop<bool>(true);
                },
                child: const Text('Ok'))
          ],
        ),
      ),
    );
  }
}

class PaddingManager {
  static const normalPadding = EdgeInsets.only(top: 10);
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
        backgroundColor: Colors.white,
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (context) {
          return _CustomMainSheet(child: child);
        });
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const _BaseSheetWidget(), Expanded(child: child)],
        ),
      ),
    );
  }
}

class _BaseSheetWidget extends StatelessWidget {
  const _BaseSheetWidget({
    Key? key,
  })  : _gridHeight = 24,
        super(key: key);

  final double _gridHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gridHeight,
      child: Stack(children: [
        Divider(
          color: Colors.black26,
          thickness: 3,
          indent: MediaQuery.of(context).size.width * 0.45,
          endIndent: MediaQuery.of(context).size.width * 0.45,
        ),
        Positioned(
          right: 10,
          top: 0,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.close),
          ),
        )
      ]),
    );
  }
}
