import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({Key? key}) : super(key: key);
  final _title = 'Create your first note';
  final _description = 'Add a note.';
  final _createNote = 'Create a Note';
  final _importNotes = 'Import Notes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PagePaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().appleBookWithoutPath),
            _TitleWidget(title: _title),
            _SubtitleWidget(
              title: _description * 10,
            ),
            const Spacer(),
            _createButon(createNote: _createNote),
            _importNote(importNotes: _importNotes),
            SizedBox(
              height: ButtonHeights().buttonHeight,
            ),
          ],
        ),
      ),
    );
  }
}

class _importNote extends StatelessWidget {
  const _importNote({
    Key? key,
    required String importNotes,
  })  : _importNotes = importNotes,
        super(key: key);

  final String _importNotes;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text(_importNotes));
  }
}

class _createButon extends StatelessWidget {
  const _createButon({
    Key? key,
    required String createNote,
  })  : _createNote = createNote,
        super(key: key);

  final String _createNote;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (() {}),
      child: SizedBox(
        height: ButtonHeights().buttonHeight,
        child: Center(
          child: Text(
            _createNote,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}

class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget(
      {Key? key, this.textAlign = TextAlign.center, required this.title})
      : super(key: key);

  final TextAlign? textAlign;
  final title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePaddingItems.verticalPadding,
      child: Text(
        title,
        textAlign: textAlign,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
    );
  }
}

class PagePaddingItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
}

class ImageItems {
  String appleBookWithoutPath = "image";
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.cover,
    );
  }

  String get _nameWithPath => "assets/png/$name.png";
}

class ButtonHeights {
  double buttonHeight = 50;
}
