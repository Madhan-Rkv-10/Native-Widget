import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NativeSwitch extends StatefulWidget {
  // the following parameters are ignored for iOS:
  /// [aActiveTrackColor], [aInactiveThumbColor], [aInactiveTrackColor],
  /// [aActiveThumbImage], [aOnActiveThumbImageError], [aInactiveThumbImage],
  /// [aOnInactiveThumbImageError], [aMaterialTapTargetSize].
  const NativeSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.aActiveTrackColor,
    this.aInactiveThumbColor,
    this.aInactiveTrackColor,
    this.aActiveThumbImage,
    this.aOnActiveThumbImageError,
    this.aInactiveThumbImage,
    this.aOnInactiveThumbImageError,
    this.thumbColor,
    this.trackColor,
    this.trackOutlineColor,
    this.thumbIcon,
    this.aMaterialTapTargetSize,
    this.applyCupertinoTheme,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
  }) : super(key: key);
  final bool value;

  /// Called when the user toggles the switch on or off.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch with the new
  /// value.
  ///
  /// If null, the switch will be displayed as disabled.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///

  final ValueChanged<bool>? onChanged;

  /// {@template flutter.material.switch.activeColor}
  /// The color to use when this switch is on.
  /// {@endtemplate}
  ///
  /// Defaults to [ColorScheme.secondary].
  ///
  /// If [thumbColor] returns a non-null color in the [MaterialState.selected]
  /// state, it will be used instead of this color.
  final Color? activeColor;

  /// {@template flutter.material.switch.activeTrackColor}
  /// The color to use on the track when this switch is on.
  /// {@endtemplate}
  ///
  /// Defaults to [ColorScheme.secondary] with the opacity set at 50%.
  ///
  /// Ignored if this switch is created with [Switch.adaptive].
  ///
  /// If [trackColor] returns a non-null color in the [MaterialState.selected]
  /// state, it will be used instead of this color.
  final Color? aActiveTrackColor;

  /// {@template flutter.material.switch.inactiveThumbColor}
  /// The color to use on the thumb when this switch is off.
  /// {@endtemplate}
  ///
  /// Defaults to the colors described in the Material design specification.
  ///
  /// Ignored if this switch is created with [Switch.adaptive].
  ///
  /// If [thumbColor] returns a non-null color in the default state, it will be
  /// used instead of this color.
  final Color? aInactiveThumbColor;

  /// {@template flutter.material.switch.inactiveTrackColor}
  /// The color to use on the track when this switch is off.
  /// {@endtemplate}
  ///
  /// Defaults to the colors described in the Material design specification.
  ///
  /// Ignored if this switch is created with [Switch.adaptive].
  ///
  /// If [trackColor] returns a non-null color in the default state, it will be
  /// used instead of this color.
  final Color? aInactiveTrackColor;

  /// {@template flutter.material.switch.activeThumbImage}
  /// An image to use on the thumb of this switch when the switch is on.
  /// {@endtemplate}
  ///
  /// Ignored if this switch is created with [Switch.adaptive].
  final ImageProvider? aActiveThumbImage;

  /// {@template flutter.material.switch.onActiveThumbImageError}
  /// An optional error callback for errors emitted when loading
  /// [aActiveThumbImage].
  /// {@endtemplate}
  final ImageErrorListener? aOnActiveThumbImageError;

  /// {@template flutter.material.switch.inactiveThumbImage}
  /// An image to use on the thumb of this switch when the switch is off.
  /// {@endtemplate}
  ///
  /// Ignored if this switch is created with [Switch.adaptive].
  final ImageProvider? aInactiveThumbImage;

  /// {@template flutter.material.switch.onInactiveThumbImageError}
  /// An optional error callback for errors emitted when loading
  /// [aInactiveThumbImage].
  /// {@endtemplate}
  final ImageErrorListener? aOnInactiveThumbImageError;

  /// {@template flutter.material.switch.thumbColor}
  /// The color of this [Switch]'s thumb.
  ///
  /// Resolved in the following states:
  ///  * [MaterialState.selected].
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  ///  * [MaterialState.disabled].
  ///
  /// {@tool snippet}
  /// This example resolves the [thumbColor] based on the current
  /// [MaterialState] of the [Switch], providing a different [Color] when it is
  /// [MaterialState.disabled].
  ///
  /// ```dart
  /// Switch(
  ///   value: true,
  ///   onChanged: (_) => true,
  ///   thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
  ///     if (states.contains(MaterialState.disabled)) {
  ///       return Colors.orange.withOpacity(.48);
  ///     }
  ///     return Colors.orange;
  ///   }),
  /// )
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  ///
  /// If null, then the value of [activeColor] is used in the selected
  /// state and [aInactiveThumbColor] in the default state. If that is also null,
  /// then the value of [SwitchThemeData.thumbColor] is used. If that is also
  /// null, then the following colors are used:
  ///
  /// | State    | Light theme                       | Dark theme                        |
  /// |----------|-----------------------------------|-----------------------------------|
  /// | Default  | `Colors.grey.shade50`             | `Colors.grey.shade400`            |
  /// | Selected | [ColorScheme.secondary] | [ColorScheme.secondary] |
  /// | Disabled | `Colors.grey.shade400`            | `Colors.grey.shade800`            |
  final MaterialStateProperty<Color?>? thumbColor;

  /// {@template flutter.material.switch.trackColor}
  /// The color of this [Switch]'s track.
  ///
  /// Resolved in the following states:
  ///  * [MaterialState.selected].
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  ///  * [MaterialState.disabled].
  ///
  /// {@tool snippet}
  /// This example resolves the [trackColor] based on the current
  /// [MaterialState] of the [Switch], providing a different [Color] when it is
  /// [MaterialState.disabled].
  ///
  /// ```dart
  /// Switch(
  ///   value: true,
  ///   onChanged: (_) => true,
  ///   thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
  ///     if (states.contains(MaterialState.disabled)) {
  ///       return Colors.orange.withOpacity(.48);
  ///     }
  ///     return Colors.orange;
  ///   }),
  /// )
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  ///
  /// If null, then the value of [aActiveTrackColor] is used in the selected
  /// state and [aInactiveTrackColor] in the default state. If that is also null,
  /// then the value of [SwitchThemeData.trackColor] is used. If that is also
  /// null, then the following colors are used:
  ///
  /// | State    | Light theme                     | Dark theme                      |
  /// |----------|---------------------------------|---------------------------------|
  /// | Default  | `Color(0x52000000)`             | `Colors.white30`                |
  /// | Selected | [activeColor] with alpha `0x80` | [activeColor] with alpha `0x80` |
  /// | Disabled | `Colors.black12`                | `Colors.white10`                |
  final MaterialStateProperty<Color?>? trackColor;

  /// {@template flutter.material.switch.trackOutlineColor}
  /// The outline color of this [Switch]'s track.
  ///
  /// Resolved in the following states:
  ///  * [MaterialState.selected].
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  ///  * [MaterialState.disabled].
  ///
  /// {@tool snippet}
  /// This example resolves the [trackOutlineColor] based on the current
  /// [MaterialState] of the [Switch], providing a different [Color] when it is
  /// [MaterialState.disabled].
  ///
  /// ```dart
  /// Switch(
  ///   value: true,
  ///   onChanged: (_) => true,
  ///   trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
  ///     if (states.contains(MaterialState.disabled)) {
  ///       return Colors.orange.withOpacity(.48);
  ///     }
  ///     return null; // Use the default color.
  ///   }),
  /// )
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  ///
  /// In Material 3, the outline color defaults to transparent in the selected
  /// state and [ColorScheme.outline] in the unselected state. In Material 2,
  /// the [Switch] track has no outline by default.
  final MaterialStateProperty<Color?>? trackOutlineColor;

  /// {@template flutter.material.switch.thumbIcon}
  /// The icon to use on the thumb of this switch
  ///
  /// Resolved in the following states:
  ///  * [MaterialState.selected].
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  ///  * [MaterialState.disabled].
  ///
  /// {@tool snippet}
  /// This example resolves the [thumbIcon] based on the current
  /// [MaterialState] of the [Switch], providing a different [Icon] when it is
  /// [MaterialState.disabled].
  ///
  /// ```dart
  /// Switch(
  ///   value: true,
  ///   onChanged: (_) => true,
  ///   thumbIcon: MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
  ///     if (states.contains(MaterialState.disabled)) {
  ///       return const Icon(Icons.close);
  ///     }
  ///     return null; // All other states will use the default thumbIcon.
  ///   }),
  /// )
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  ///
  /// If null, then the value of [SwitchThemeData.thumbIcon] is used. If this is also null,
  /// then the [Switch] does not have any icons on the thumb.
  final MaterialStateProperty<Icon?>? thumbIcon;

  /// {@template flutter.material.switch.materialTapTargetSize}
  /// Configures the minimum size of the tap target.
  /// {@endtemplate}
  ///
  /// If null, then the value of [SwitchThemeData.materialTapTargetSize] is
  /// used. If that is also null, then the value of
  /// [ThemeData.materialTapTargetSize] is used.
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  final MaterialTapTargetSize? aMaterialTapTargetSize;

  /// {@macro flutter.cupertino.CupertinoSwitch.applyTheme}
  final bool? applyCupertinoTheme;

  /// {@macro flutter.cupertino.CupertinoSwitch.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@template flutter.material.switch.mouseCursor}
  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
  /// [MaterialStateProperty.resolve] is used for the following [MaterialState]s:
  ///
  ///  * [MaterialState.selected].
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  ///  * [MaterialState.disabled].
  /// {@endtemplate}
  ///
  /// If null, then the value of [SwitchThemeData.mouseCursor] is used. If that
  /// is also null, then [MaterialStateMouseCursor.clickable] is used.
  ///
  /// See also:
  ///
  ///  * [MaterialStateMouseCursor], a [MouseCursor] that implements
  ///    `MaterialStateProperty` which is used in APIs that need to accept
  ///    either a [MouseCursor] or a [MaterialStateProperty<MouseCursor>].
  final MouseCursor? mouseCursor;

  /// The color for the button's [Material] when it has the input focus.
  ///
  /// If [overlayColor] returns a non-null color in the [MaterialState.focused]
  /// state, it will be used instead.
  ///
  /// If null, then the value of [SwitchThemeData.overlayColor] is used in the
  /// focused state. If that is also null, then the value of
  /// [ThemeData.focusColor] is used.
  final Color? focusColor;

  /// The color for the button's [Material] when a pointer is hovering over it.
  ///
  /// If [overlayColor] returns a non-null color in the [MaterialState.hovered]
  /// state, it will be used instead.
  ///
  /// If null, then the value of [SwitchThemeData.overlayColor] is used in the
  /// hovered state. If that is also null, then the value of
  /// [ThemeData.hoverColor] is used.
  final Color? hoverColor;

  /// {@template flutter.material.switch.overlayColor}
  /// The color for the switch's [Material].
  ///
  /// Resolves in the following states:
  ///  * [MaterialState.pressed].
  ///  * [MaterialState.selected].
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  /// {@endtemplate}
  ///
  /// If null, then the value of [activeColor] with alpha
  /// [kRadialReactionAlpha], [focusColor] and [hoverColor] is used in the
  /// pressed, focused and hovered state. If that is also null,
  /// the value of [SwitchThemeData.overlayColor] is used. If that is
  /// also null, then the value of [ColorScheme.secondary] with alpha
  /// [kRadialReactionAlpha], [ThemeData.focusColor] and [ThemeData.hoverColor]
  /// is used in the pressed, focused and hovered state.
  final MaterialStateProperty<Color?>? overlayColor;

  /// {@template flutter.material.switch.splashRadius}
  /// The splash radius of the circular [Material] ink response.
  /// {@endtemplate}
  ///
  /// If null, then the value of [SwitchThemeData.splashRadius] is used. If that
  /// is also null, then [kRadialReactionRadius] is used.
  final double? splashRadius;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.material.inkwell.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  @override
  State<NativeSwitch> createState() => _NativeSwitchState();
}

class _NativeSwitchState extends State<NativeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: widget.value,
      onChanged: widget.onChanged,
      activeColor: widget.activeColor,
      activeTrackColor: widget.aActiveTrackColor,
      inactiveThumbColor: widget.aInactiveThumbColor,
      inactiveTrackColor: widget.aInactiveTrackColor,
      activeThumbImage: widget.aActiveThumbImage,
      onActiveThumbImageError: widget.aOnActiveThumbImageError,
      inactiveThumbImage: widget.aInactiveThumbImage,
      onInactiveThumbImageError: widget.aOnInactiveThumbImageError,
      materialTapTargetSize: widget.aMaterialTapTargetSize,
      thumbColor: widget.thumbColor,
      trackColor: widget.trackColor,
      trackOutlineColor: widget.trackOutlineColor,
      thumbIcon: widget.thumbIcon,
      dragStartBehavior: widget.dragStartBehavior,
      mouseCursor: widget.mouseCursor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      overlayColor: widget.overlayColor,
      splashRadius: widget.splashRadius,
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      autofocus: widget.autofocus,
      applyCupertinoTheme: widget.applyCupertinoTheme,
    );
  }
}
