// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_widget/src/utils/helpers.dart';

class NativeProgressIndicator extends StatefulWidget {
  final Color? color;

  /// [a] means it works only in android
  ///  [aValueColor], [aStrokeWidth] will be ignored in iOS.
  ///
  /// Whether the activity indicator is running its animation for iOS.

  /// Defaults to true.
  final bool animating;

  /// Radius of the spinner widget.

  /// Defaults to 10px. Must be positive and cannot be null.
  final double radius;
  final Animation<Color>? aValueColor;
  final Color? aBackgroundColor;
  final double? aStrokewidth;
  final String? aSemanticlabel;
  final String? aSemanticValue;

  /// Determines the percentage of spinner ticks that will be shown. Typical usage would
  /// display all ticks, however, this allows for more fine-grained control such as
  /// during pull-to-refresh when the drag-down action shows one tick at a time as
  /// the user continues to drag down.
  ///
  /// Defaults to 1.0. Must be between 0.0 and 1.0 inclusive, and cannot be null.
  final double? progressValue;
  const NativeProgressIndicator({
    Key? key,
    this.color,
    this.animating = true,
    this.aValueColor,
    this.aSemanticValue,
    this.aSemanticlabel,
    this.radius = 10,
    this.aBackgroundColor,
    this.aStrokewidth,
    this.progressValue,
  }) : super(key: key);
  @override
  State<NativeProgressIndicator> createState() =>
      _NativeProgressIndicatorState();
}

class _NativeProgressIndicatorState extends State<NativeProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if (theme.platform == TargetPlatform.iOS ||
        theme.platform == TargetPlatform.macOS) {
      if (widget.progressValue != null) {
        return CupertinoActivityIndicator.partiallyRevealed(
          color: widget.color,
          radius: widget.radius,
          progress: widget.progressValue!,
          key: widget.key,
        );
      } else {
        return CupertinoActivityIndicator(
          color: widget.color,
          radius: widget.radius,
          animating: widget.animating,
          key: widget.key,
        );
      }
    } else {
      return SizedBox.fromSize(
        size: Size(
          widget.radius * UIDimens.size2,
          widget.radius * UIDimens.size2,
        ),
        child: CircularProgressIndicator(
          backgroundColor: widget.aBackgroundColor,
          value: widget.progressValue,
          color: widget.color,
          valueColor: widget.aValueColor,
          strokeWidth: widget.aStrokewidth ?? UIDimens.size4,
        ),
      );
    }
  }
}
