// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_widget/src/widgets/native_show_widget.dart';

class NativeTextButton extends StatelessWidget {
  const NativeTextButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return NativeShow(
      cupertinoChild: CupertinoButton.filled(
        onPressed: onPressed,
        child: child,
      ),
      materialChild: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
