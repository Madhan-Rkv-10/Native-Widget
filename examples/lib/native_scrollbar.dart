import 'package:flutter/material.dart';
import 'package:native_widget/native_widget.dart';

class NativeScrollbarExample extends StatefulWidget {
  const NativeScrollbarExample({super.key});

  @override
  State<NativeScrollbarExample> createState() => _NativeScrollbarExampleState();
}

class _NativeScrollbarExampleState extends State<NativeScrollbarExample> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: NativeScrollbar(child: Text("data")),
      ),
    );
  }
}
