import 'package:flutter/material.dart';
import 'package:native_widget/native_widget.dart';

class NativeScrollbar extends StatefulWidget {
  const NativeScrollbar({super.key});

  @override
  State<NativeScrollbar> createState() => _NativeScrollbarState();
}

class _NativeScrollbarState extends State<NativeScrollbar> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scrollbar(
          child: Text("data"),
          thumbVisibility: true,
          hoverThickness: 8,
        ),
      ),
    );
  }
}
