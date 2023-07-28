import 'package:flutter/material.dart';
import 'package:native_widget/native_widget.dart';

class NativeSliderExample extends StatefulWidget {
  const NativeSliderExample({super.key});

  @override
  State<NativeSliderExample> createState() => _NativeSliderExampleState();
}

class _NativeSliderExampleState extends State<NativeSliderExample> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NativeSlider(
            value: value,
            activeColor: Colors.grey,
            thumbColor: Colors.red,
            onChanged: (d) {
              setState(() {
                value = d;
              });
            }),
      ),
    );
  }
}
