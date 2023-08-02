import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        key: key,
        items: items,
        onTap: onTap,
        currentIndex: currentIndex,
        iconSize: iconSize,
        inactiveColor: inactiveColor,
        border: border,
        height: height,
        activeColor: activeColor,
        backgroundColor: backgroundColor,
      ),
      materialChild: SizedBox(
        height: height,
        child: BottomNavigationBar(
          key: key,
          items: items,
          iconSize: iconSize,
          onTap: onTap,
          currentIndex: currentIndex,
          backgroundColor: backgroundColor,
          selectedItemColor: activeColor,
          unselectedItemColor: inactiveColor,
        ),
      ),
    );
  }
}
