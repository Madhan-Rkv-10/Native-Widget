import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showNativeDatePicker({
  required BuildContext context,
  required void Function(DateTime time) onChanged,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  Color? color,
}) async {
  final iOS = (Theme.of(context).platform == (TargetPlatform.iOS) ||
      Theme.of(context).platform == (TargetPlatform.macOS));
  if (!iOS) {
    Widget dialog = DatePickerDialog(
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    final DateTime? pickedDate = await showDialog<DateTime>(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return Theme(
            data: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                seedColor: color ?? Colors.blue,
              ),
            ),
            child: dialog);
      },
    );
    if (pickedDate != null) {
      onChanged(pickedDate);
    }
  } else {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: color,
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: initialDate,
            mode: CupertinoDatePickerMode.date,
            maximumDate: lastDate,
            minimumDate: firstDate,
            backgroundColor: color,
            // This shows day of week alongside day of month
            showDayOfWeek: true,
            // This is called when the user changes the date.
            onDateTimeChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
