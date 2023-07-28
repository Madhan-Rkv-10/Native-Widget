import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NativeSlider extends StatefulWidget {
  final double value;

  final double? secondaryTrackValue;

  final ValueChanged<double>? onChanged;

  final ValueChanged<double>? onChangeStart;

  final ValueChanged<double>? onChangeEnd;

  final double min;

  final double max;

  final int? divisions;

  final String? label;

  final Color? activeColor;

  final Color? inactiveColor;

  final Color? secondaryActiveColor;

  final Color? thumbColor;

  final MaterialStateProperty<Color?>? overlayColor;

  final MouseCursor? mouseCursor;

  final SemanticFormatterCallback? semanticFormatterCallback;

  final FocusNode? focusNode;

  final bool autofocus;

  const NativeSlider(
      {super.key,
      required this.value,
      this.secondaryTrackValue,
      this.onChanged,
      this.onChangeStart,
      this.onChangeEnd,
      required this.min,
      required this.max,
      this.divisions,
      this.label,
      this.activeColor,
      this.inactiveColor,
      this.secondaryActiveColor,
      this.thumbColor,
      this.overlayColor,
      this.mouseCursor,
      this.semanticFormatterCallback,
      this.focusNode,
      required this.autofocus});

  @override
  State<NativeSlider> createState() => _NativeSliderState();
}

class _NativeSliderState extends State<NativeSlider> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return const Placeholder();
  }
}
