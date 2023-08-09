import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showNativeDialog(
    {required BuildContext context,
    Widget? title,
    Widget? content,
    List<Widget> actions = const []}) async {
  bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

  if (isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions,
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: title,
        content: content,
        actions: actions,
        scrollable: true,
      ),
    );
  }
}
