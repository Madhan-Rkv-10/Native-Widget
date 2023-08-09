import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showNativeDialog(
    {required BuildContext context,
    Widget? title,
    Widget? content,
    String? barriarlable,
    bool useRootNavigator = true,
    bool barrierDismissible = false,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    List<Widget> actions = const []}) async {
  bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

  if (isIOS) {
    showCupertinoDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      barrierLabel: barriarlable,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      builder: (context) => CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions,
      ),
    );
  } else {
    showDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      barrierLabel: barriarlable,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      builder: (context) => AlertDialog(
        title: title,
        content: content,
        actions: actions,
        scrollable: true,
      ),
    );
  }
}
