import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<void> showNativeTimePicker({
  required BuildContext context,
  required void Function(TimeOfDay time) onChanged,
  DateTime? initialTime,
  bool alwaysUse24HourFormat = true,
  Color? color,
}) async {
  DateTime time = initialTime ?? DateTime.now();
  final iOS = (Theme.of(context).platform == (TargetPlatform.iOS) ||
      Theme.of(context).platform == (TargetPlatform.macOS));
  if (!iOS) {
    Widget dialog = TimePickerDialog(
      initialTime: TimeOfDay.fromDateTime(time),
    );
    final TimeOfDay? pickedDate = await showDialog<TimeOfDay>(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(alwaysUse24HourFormat: alwaysUse24HourFormat),
            child: Theme(
                data: ThemeData.from(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: color ?? Colors.blue,
                  ),
                ),
                child: dialog));
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
        color: color ?? Colors.white,
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: initialTime,
            mode: CupertinoDatePickerMode.time,
            use24hFormat: alwaysUse24HourFormat,

            // This is called when the user changes the date.
            onDateTimeChanged: (DateTime time) {
              onChanged(TimeOfDay.fromDateTime(time));
            },
          ),
        ),
      ),
    );
  }
}
