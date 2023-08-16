import 'package:flutter/material.dart';
import 'package:native_widget/native_widget.dart';

class NativeCheckBoxExample extends StatefulWidget {
  const NativeCheckBoxExample({super.key});

  @override
  State<NativeCheckBoxExample> createState() => _NativeCheckBoxExampleState();
}

class _NativeCheckBoxExampleState extends State<NativeCheckBoxExample> {
  bool onChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NativeCheckBox(
            value: onChanged,
            onChanged: (value) {
              setState(() {
                onChanged = value!;
              });
            }),
      ),
    );
  }
}
