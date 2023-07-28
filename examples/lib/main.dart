import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_widget/native_widget.dart';

import 'native_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NativeSliderExample(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool value = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
      value = !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            NativeCheckBox(
              value: value,
              onChanged: (d) {},
            ),
            const CupertinoActivityIndicator(
              animating: false,
              radius: 30,
            ),
            NativeRadio(
              value: value,
              groupValue: "groupValue",
              onChanged: null,
            ),
            SizedBox.fromSize(
              size: const Size(30 * 2, 30 * 2),
              child: const CircularProgressIndicator(
                // backgroundColor: Colors.red,
                value: null,
                color: Colors.blue,
                // valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                strokeWidth: 5.0,
                semanticsLabel: "Madhan",
                semanticsValue: "VALUE ADHAN",
              ),
            ),
            CupertinoActivityIndicator.partiallyRevealed(
              color: Colors.blue,
              radius: 30,
              key: widget.key,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
