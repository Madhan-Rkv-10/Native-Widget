import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_widget/src/widgets/native_show_widget.dart';

class NativeElevatedButton extends StatelessWidget {
  const NativeElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.padding,
      this.alignment = Alignment.center,
      this.backgroundColor,
      this.disabledColor = CupertinoColors.quaternarySystemFill,
      this.borderRadius = const BorderRadius.all(Radius.circular(8.0))})
      : super(key: key);
  final VoidCallback onPressed;
  final Widget child;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? disabledColor;

  /// Defaults to the [CupertinoTheme] 's `primaryColor` when the background color is Null;
  /// Defaults to the [MaterialTheme] 's `primaryColor` when the background color is Null;

  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    final CupertinoThemeData iOSTheme = CupertinoTheme.of(context);
    final ThemeData androidTheme = Theme.of(context);

    return NativeShow(
      cupertinoChild: CupertinoButton(
        onPressed: onPressed,
        padding: padding,
        borderRadius: borderRadius,
        disabledColor: disabledColor!,
        color: iOSTheme.primaryColor,
        child: child,
      ),
      materialChild: padding == null
          ? ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                alignment: alignment,
                backgroundColor: androidTheme.primaryColor,
                disabledForegroundColor: disabledColor,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius!,
                ),
              ),
              child: child,
            )
          : Padding(
              padding: padding!,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  alignment: alignment,
                  backgroundColor: androidTheme.primaryColor,
                  disabledForegroundColor: disabledColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius!,
                  ),
                ),
                child: child,
              ),
            ),
    );
  }
}
