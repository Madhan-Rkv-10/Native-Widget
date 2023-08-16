<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->



# Native Widget

A native widget that provides adaptive widgets based on platform is a widget that can be rendered differently depending on the platform it is running on. 
# Content

- [Installation](#installation)
- [List of Native Widgets](#list-of-native-widgets)


# Installation ⬇️
Add to pubspec.yaml.
```dart
dependencies:
  ...
  native_widget: ^0.0.1
```

## Add the following imports to your Dart code: 
```dart
import 'package:native_widget/native_widget.dart';
```

## List of Native Widgets
- Native Date Picker
- Native Time Picker
- Native Switch
- Native Slider
- Native ProgressIndicator
- Native DialogBox
- Native BottomNavbar
- Native CheckBox
- Native Radio
- Native BottomNavbar
- Native Scrollbar



 
### Native Date Picker
  To use native DatePicker ,Add LocalizationDelegate In your MaterialApp or CupertinoApp
 ```dart
localizationsDelegates: [
      DefaultMaterialLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
   ]
 ``` 
 #### Usage
```dart
TextButton(
           onPressed: () {
             showNativeDatePicker(
               context: context,
               onChanged: (selectedDate) {
                log("selected date$date")
               },
               initialDate: DateTime.now(),
               firstDate: DateTime(2020),
               lastDate: DateTime.now(),
             );
           },
           child: const Text("Select Date"),
         )
```

### Native Time Picker

#### Usage
```dart
TextButton(
           onPressed: () {
             showNativeTimePicker(
                 context: context,
                 onChanged: (time) {
                   log("selected time$time")
                 });
           },
           child: const Text("Select Time"),
         )
```
### Native dialog  

```dart
TextButton(
            onPressed: () {
              showNativeDialog(
                barrierDismissible: true,
                context: context,
                title: const Text(
                  "Sample Dialog",
                ),
              );
            },
            child: const Text(
              "open Dialog",
            ),
          )
```
### Native CheckBox 
#### Usage
```dart
NativeCheckBox(
            value: onChanged,
            onChanged: (value) {
              setState(() {
                onChanged = value!;
              });
            })
```

## Issue and feedback 💭 

If you have any suggestion for including a feature or if something doesn't work, feel free to open a Github [issue](https://github.com/Madhan-Rkv-10/Native-Widget/issues) for us to have a discussion on it.