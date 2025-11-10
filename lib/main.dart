import 'package:flutter/material.dart';
import 'package:h1d023048_tugas6/ui/form_data.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 6',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FormData(),
    );
  }
}
