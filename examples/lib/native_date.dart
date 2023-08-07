import 'package:flutter/material.dart';
import 'package:native_widget/native_widget.dart';

class NativeDatePicker extends StatefulWidget {
  const NativeDatePicker({super.key});

  @override
  State<NativeDatePicker> createState() => _NativeDatePickerState();
}

class _NativeDatePickerState extends State<NativeDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        // Display a CupertinoDatePicker in date picker mode.
        onPressed: () => showNativeDatePicker(
            context: context,
            onChanged: (onChanged) {
              print("object");
            },
            initialDate: DateTime.now(),
            firstDate: DateTime(2015),
            lastDate: DateTime(2050)),
        // In this example, the date is formatted manually. You can
        // use the intl package to format the value based on the
        // user's locale settings.
        child: const Text(
          'pickDate',
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
