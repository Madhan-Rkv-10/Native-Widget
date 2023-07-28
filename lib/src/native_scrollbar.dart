// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart' show CupertinoScrollbar;
import 'package:flutter/material.dart'
    show
        Scrollbar,
        ScrollController,
        Key,
        Radius,
        ScrollNotificationPredicate,
        ScrollbarOrientation,
        BuildContext;
import 'package:flutter/widgets.dart' show StatelessWidget, Widget;
import 'package:native_widget/src/widgets/native_show_widget.dart';

class NativeScrollbar extends StatelessWidget {
  const NativeScrollbar({
    Key? key,
    required this.child,
    this.controller,
    this.thumbVisibility,
    this.thickness,
    this.radius,
    this.interactive,
    this.notificationPredicate,
    this.scrollbarOrientation,
  }) : super(key: key);
  final Widget child;

  /// {@macro flutter.widgets.Scrollbar.controller}
  final ScrollController? controller;

  /// {@macro flutter.widgets.Scrollbar.thumbVisibility}
  ///
  /// If this property is null, then [ScrollbarThemeData.thumbVisibility] of
  /// [ThemeData.scrollbarTheme] is used. If that is also null, the default value
  /// is false.
  ///
  /// If the thumb visibility is related to the scrollbar's material state,
  /// use the global [ScrollbarThemeData.thumbVisibility] or override the
  /// sub-tree's theme data.
  ///
  /// Replaces deprecated [isAlwaysShown].
  final bool? thumbVisibility;

  /// {@macro flutter.widgets.Scrollbar.isAlwaysShown}
  ///
  /// To show the scrollbar thumb based on a [MaterialState], use
  /// [ScrollbarThemeData.thumbVisibility].

  /// The thickness of the scrollbar when a hover state is active and
  ///
  /// If this property is null, then [ScrollbarThemeData.thickness] of
  /// [ThemeData.scrollbarTheme] is used to resolve a thickness. If that is also
  /// null, the default value is 12.0 pixels.
  ///
  /// This is deprecated, use [ScrollbarThemeData.thickness] to resolve based on
  /// the current state instead.

  /// The thickness of the scrollbar in the cross axis of the scrollable.
  /// If null, the default value is platform dependent. On [TargetPlatform.android],
  /// the default thickness is 4.0 pixels. On [TargetPlatform.iOS],
  /// [CupertinoScrollbar.defaultThickness] is used. The remaining platforms have a
  /// default thickness of 8.0 pixels.
  final double? thickness;

  /// The [Radius] of the scrollbar thumb's rounded rectangle corners.
  ///
  /// If null, the default value is platform dependent. On [TargetPlatform.android],
  /// no radius is applied to the scrollbar thumb. On [TargetPlatform.iOS],
  /// [CupertinoScrollbar.defaultRadius] is used. The remaining platforms have a
  /// default [Radius.circular] of 8.0 pixels.
  final Radius? radius;

  /// {@macro flutter.widgets.Scrollbar.interactive}
  final bool? interactive;

  /// {@macro flutter.widgets.Scrollbar.notificationPredicate}
  final ScrollNotificationPredicate? notificationPredicate;

  /// {@macro flutter.widgets.Scrollbar.scrollbarOrientation}
  final ScrollbarOrientation? scrollbarOrientation;

  @override
  Widget build(BuildContext context) {
    return NativeShow(
      cupertinoChild: CupertinoScrollbar(
        thumbVisibility: thumbVisibility ?? false,
        thickness: thickness ?? CupertinoScrollbar.defaultThickness,
        thicknessWhileDragging:
            thickness ?? CupertinoScrollbar.defaultThicknessWhileDragging,
        radius: radius ?? CupertinoScrollbar.defaultRadius,
        radiusWhileDragging:
            radius ?? CupertinoScrollbar.defaultRadiusWhileDragging,
        controller: controller,
        notificationPredicate: notificationPredicate,
        scrollbarOrientation: scrollbarOrientation,
        child: child,
      ),
      materialChild: Scrollbar(
        controller: controller,
        thumbVisibility: thumbVisibility,
        thickness: thickness,
        radius: radius,
        notificationPredicate: notificationPredicate,
        interactive: interactive,
        scrollbarOrientation: scrollbarOrientation,
        child: child,
      ),
    );
  }
}
