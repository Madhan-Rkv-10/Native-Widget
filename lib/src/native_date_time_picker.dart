import 'package:flutter/material.dart';

class NativeDateTimePicker extends StatefulWidget {
  const NativeDateTimePicker({super.key});

  @override
  State<NativeDateTimePicker> createState() => _NativeDateTimePickerState();
}

class _NativeDateTimePickerState extends State<NativeDateTimePicker> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    if (theme.platform == TargetPlatform.iOS ||
        theme.platform == TargetPlatform.macOS) {
      return Text("data");
    } else {
      return Text("data");
    }
  }
}

class Sam {
  Future<DateTime?> showDatePicker(
      {required BuildContext context,
      required DateTime initialDate,
      required DateTime firstDate,
      required DateTime lastDate,
      DateTime? currentDate,
      DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
      SelectableDayPredicate? selectableDayPredicate,
      String? helpText,
      String? cancelText,
      String? confirmText,
      Locale? locale,
      bool useRootNavigator = true,
      RouteSettings? routeSettings,
      TextDirection? textDirection,
      TransitionBuilder? builder,
      DatePickerMode initialDatePickerMode = DatePickerMode.day,
      String? errorFormatText,
      String? errorInvalidText,
      String? fieldHintText,
      String? fieldLabelText,
      TextInputType? keyboardType,
      Offset? anchorPoint,
      final ValueChanged<DatePickerEntryMode>? onDatePickerModeChange}) async {
    initialDate = DateUtils.dateOnly(initialDate);
    firstDate = DateUtils.dateOnly(firstDate);
    lastDate = DateUtils.dateOnly(lastDate);
    assert(
      !lastDate.isBefore(firstDate),
      'lastDate $lastDate must be on or after firstDate $firstDate.',
    );
    assert(
      !initialDate.isBefore(firstDate),
      'initialDate $initialDate must be on or after firstDate $firstDate.',
    );
    assert(
      !initialDate.isAfter(lastDate),
      'initialDate $initialDate must be on or before lastDate $lastDate.',
    );
    assert(
      selectableDayPredicate == null || selectableDayPredicate(initialDate),
      'Provided initialDate $initialDate must satisfy provided selectableDayPredicate.',
    );
    assert(debugCheckHasMaterialLocalizations(context));

    Widget dialog = DatePickerDialog(
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      currentDate: currentDate,
      initialEntryMode: initialEntryMode,
      selectableDayPredicate: selectableDayPredicate,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      initialCalendarMode: initialDatePickerMode,
      errorFormatText: errorFormatText,
      errorInvalidText: errorInvalidText,
      fieldHintText: fieldHintText,
      fieldLabelText: fieldLabelText,
      keyboardType: keyboardType,
      onDatePickerModeChange: onDatePickerModeChange,
    );

    if (textDirection != null) {
      dialog = Directionality(
        textDirection: textDirection,
        child: dialog,
      );
    }

    if (locale != null) {
      dialog = Localizations.override(
        context: context,
        locale: locale,
        child: dialog,
      );
    }

    return showDialog<DateTime>(
      context: context,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (BuildContext context) {
        return builder == null ? dialog : builder(context, dialog);
      },
      anchorPoint: anchorPoint,
    );
  }
}
