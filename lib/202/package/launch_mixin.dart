import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

mixin LaunchMixin {
  void name();
  void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }
}
