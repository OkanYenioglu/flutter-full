import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  CustomWidgetLearn({Key? key}) : super(key: key);

  String title = 'Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomFootButton(
                  title: title,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
          CustomFootButton(
            title: title,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _ColorUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = EdgeInsets.all(16.0);
}

class CustomFootButton extends StatelessWidget
    with _ColorUtility, _PaddingUtility {
  CustomFootButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:
          ElevatedButton.styleFrom(primary: redColor, shape: StadiumBorder()),
      child: Padding(
        padding: normal2xPadding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
