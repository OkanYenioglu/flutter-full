import 'package:flutter/material.dart';

class NavigateHomeDetail extends StatefulWidget {
  NavigateHomeDetail({Key? key, this.id}) : super(key: key);
  String? id;
  @override
  State<NavigateHomeDetail> createState() => _NavigateHomeDetailState();
}

class _NavigateHomeDetailState extends State<NavigateHomeDetail> {
  String? _id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _id = widget.id;

    if (_id == null) {
      Future.microtask(() {
        final _modelId = ModalRoute.of(context)?.settings.arguments;

        setState(() {
          _id = _modelId is String ? _modelId : widget.id;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).errorColor,
        title: Text(_id ?? ''),
      ),
    );
  }
}
