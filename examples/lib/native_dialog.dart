import 'package:flutter/material.dart';
import 'package:native_widget/native_widget.dart';

class NativeDialogExample extends StatefulWidget {
  const NativeDialogExample({super.key});

  @override
  State<NativeDialogExample> createState() => _NativeDialogExampleState();
}

class _NativeDialogExampleState extends State<NativeDialogExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
        ],
      ),
    );
  }
}
