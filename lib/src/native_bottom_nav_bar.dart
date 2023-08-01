// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:native_widget/src/widgets/native_show_widget.dart';

class NativeBottomNavBar extends StatelessWidget {
  const NativeBottomNavBar({
    Key? key,
    required this.items,
    this.onTap,
    this.currentIndex = 1,
    this.iconSize = 30.0,
    this.color,
    this.backgroundColor,
    this.height = 50.0,
    this.activeColor,
    this.inactiveColor = CupertinoColors.inactiveGray,
    this.border = const Border(
      top: BorderSide(
        color: CupertinoDynamicColor.withBrightness(
          color: Color(0x4D000000),
          darkColor: Color(0x29000000),
        ),
        width: 0.0, // 0.0 means one physical pixel
      ),
    ),
  }) : super(key: key);
  final List<BottomNavigationBarItem> items;
  final void Function(int)? onTap;
  final Color? backgroundColor;

  final int currentIndex;
  final Color? color;
  final double iconSize;

  /// The height of the [CupertinoTabBar].
  ///
  /// Defaults to 50.0. Must not be null.
  final double height;

  /// The border of the [CupertinoTabBar].
  ///
  /// The default value is a one physical pixel top border with grey color.
  final Border? border;

  final Color? activeColor;
  final Color inactiveColor;
  @override
  Widget build(BuildContext context) {
    return NativeShow(
      cupertinoChild: CupertinoTabBar(
        items: items,
        onTap: onTap,
        currentIndex: currentIndex,
        iconSize: iconSize,
        inactiveColor: inactiveColor,
        border: border,
        height: height,
        backgroundColor: backgroundColor,
      ),
      materialChild: Text(
        "",
      ),
    );
  }
}
