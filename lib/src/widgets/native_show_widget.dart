// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NativeShow extends StatelessWidget {
  ///To display widget based on Platform
  ///

  const NativeShow({
    Key? key,
    required this.cupertinoChild,
    required this.materialChild,
  }) : super(key: key);
  final Widget cupertinoChild;
  final Widget materialChild;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final iOS = (theme.platform == (TargetPlatform.iOS) ||
        theme.platform == (TargetPlatform.macOS));
    if (iOS) {
      return cupertinoChild;
    } else {
      return materialChild;
    }
  }
}
