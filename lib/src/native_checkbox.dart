import 'package:flutter/cupertino.dart' show CupertinoCheckbox;
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart'
    show
        Color,
        Theme,
        VisualDensity,
        MaterialStateProperty,
        MaterialTapTargetSize,
        ThemeData,
        Checkbox;

class NativeCheckBox extends StatefulWidget {
  /// The checkbox itself does not maintain any state. Instead, when the state of
  /// the checkbox changes, the widget calls the [onChanged] callback. Most
  /// widgets that use a checkbox will listen for the [onChanged] callback and
  /// rebuild the checkbox with a new [value] to update the visual appearance of
  /// the checkbox.
  ///
  /// The following arguments are required:

  ///
  /// * [value], which determines whether the checkbox is checked. The [value]
  ///   can only be null if [tristate] is true.
  /// * [onChanged], which is called when the value of the checkbox should
  ///   change. It can be set to null to disable the checkbox.
  ///
  ///  The following parameters are ignored for iOS:
  ///  [mouseCursor], [hoverColor], [overlayColor], [splashRadius],
  ///  [materialTapTargetSize], [visualDensity], [isError].
  const NativeCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.checkColor,
    this.tristate = false,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.side,
    this.shape,

    /// are ignored for iOS
    this.mouseCursor,
    this.fillColor,
    this.materialTapTargetSize,
    this.visualDensity,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
  }) : assert(tristate || value != null);
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? checkColor;
  final bool tristate;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final BorderSide? side;
  final OutlinedBorder? shape;
  final MouseCursor? mouseCursor;
  final MaterialStateProperty<Color?>? fillColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;

  @override
  State<NativeCheckBox> createState() => _NativeCheckBoxState();
}

class _NativeCheckBoxState extends State<NativeCheckBox> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    if (theme.platform == TargetPlatform.iOS ||
        theme.platform == TargetPlatform.macOS) {
      return CupertinoCheckbox(
        value: widget.value,
        tristate: widget.tristate,
        onChanged: widget.onChanged,
        activeColor: widget.activeColor,
        checkColor: widget.checkColor,
        focusColor: widget.focusColor,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        side: widget.side,
        shape: widget.shape,
      );
    } else {
      return Checkbox.adaptive(
          value: widget.value,
          onChanged: widget.onChanged,
          activeColor: widget.activeColor,
          checkColor: widget.checkColor,
          tristate: widget.tristate,
          focusColor: widget.focusColor,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          side: widget.side,
          shape: widget.shape,
          mouseCursor: widget.mouseCursor,
          fillColor: widget.fillColor,
          materialTapTargetSize: widget.materialTapTargetSize,
          visualDensity: widget.visualDensity,
          hoverColor: widget.hoverColor,
          overlayColor: widget.overlayColor,
          splashRadius: widget.splashRadius);
    }
  }
}
