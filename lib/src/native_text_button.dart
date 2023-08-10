import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_widget/src/widgets/native_show_widget.dart';

class NativeTextButton extends StatelessWidget {
  const NativeTextButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.padding,
      this.alignment = Alignment.center,
      this.disabledColor = CupertinoColors.quaternarySystemFill,
      this.borderRadius = const BorderRadius.all(Radius.circular(8.0))})
      : super(key: key);
  final VoidCallback onPressed;
  final Widget child;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? disabledColor;
  @override
  Widget build(BuildContext context) {
    return NativeShow(
      cupertinoChild: CupertinoButton(
        onPressed: onPressed,
        padding: padding,
        borderRadius: borderRadius,
        disabledColor: disabledColor!,
        child: child,
      ),
      materialChild: padding == null
          ? TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                  alignment: alignment,
                  disabledForegroundColor: disabledColor,
                  shape: RoundedRectangleBorder(borderRadius: borderRadius!)),
              child: child,
            )
          : Padding(
              padding: padding!,
              child: TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                    alignment: alignment,
                    disabledForegroundColor: disabledColor,
                    shape: RoundedRectangleBorder(borderRadius: borderRadius!)),
                child: child,
              ),
            ),
    );
  }
}
