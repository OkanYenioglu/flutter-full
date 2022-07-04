import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  AlertLearn({Key? key}) : super(key: key);

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final result = await showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              // return const _AlertDialog();
              // return UpdateDialog(context: context);
              return const _ImageZoomDialog();
            });

        if (result is bool) {
          setState(() {
            _backgroundColor = Colors.lightGreen;
          });
        }
      }),
    );
  }
}

class _AlertDialog extends StatelessWidget {
  const _AlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('data'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Ok')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'))
      ],
    );
  }
}

class Keys {
  static const versionUpdate = 'Version update!';
  static const updateButton = 'Update';
  static const closeButton = 'Close';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text(Keys.versionUpdate),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(Keys.updateButton)),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(Keys.closeButton))
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);

  final String _url = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: InteractiveViewer(
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.5,
        ),
      ),
    );
  }
}
