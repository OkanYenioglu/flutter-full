import 'package:flutter/material.dart';

class NavigateDetailLearnDart extends StatefulWidget {
  NavigateDetailLearnDart({Key? key, this.isOkay = false}) : super(key: key);
  final bool isOkay;

  @override
  State<NavigateDetailLearnDart> createState() => _NavigateDetailLearnDartState();
}

class _NavigateDetailLearnDartState extends State<NavigateDetailLearnDart> {
  @override
  void didUpdateWidget(covariant NavigateDetailLearnDart oldWidget) {
    super.didUpdateWidget(oldWidget);
    //ModalRoute.of(context).settings.arguments
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop(!widget.isOkay);
          },
          icon: widget.isOkay ? const Icon(Icons.close) : const Icon(Icons.check),
          label: widget.isOkay ? const Text('Red') : const Text('Onayla'),
        ),
      ),
    );
  }
}
