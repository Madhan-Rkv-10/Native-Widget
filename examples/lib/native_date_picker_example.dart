import 'package:flutter/material.dart';
import 'package:native_widget/native_widget.dart';

class NativeDatePickerExample extends StatefulWidget {
  const NativeDatePickerExample({super.key});

  @override
  State<NativeDatePickerExample> createState() =>
      _NativeDatePickerExampleState();
}

class _NativeDatePickerExampleState extends State<NativeDatePickerExample> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                showNativeDatePicker(
                  context: context,
                  onChanged: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
              },
              child: const Text("Select Date"),
            ),
            Text("Selected Date $_selectedDate"),
            TextButton(
              onPressed: () {
                showNativeTimePicker(
                    context: context,
                    onChanged: (time) {
                      setState(() {
                        _selectedTime = time;
                      });
                    });
              },
              child: const Text("Select Time"),
            ),
            Text("Selected Time $_selectedTime"),
          ],
        ),
      ),
    );
  }
}
