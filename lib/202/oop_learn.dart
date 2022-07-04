import 'dart:io';

import 'package:flutter_full/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);
  void toShare(String path) async {
    await launchUrlString(path);
  }
}

class FileDownload {
  bool downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('a');
    return true;
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}
