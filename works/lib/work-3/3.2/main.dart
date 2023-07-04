import 'package:flutter/material.dart';
import 'package:quest1/work-3/3.2/random_lines.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text("d_art work 3.2"),
        ),
        body: Center(
          child: Container(
              height: 200,
              width: 200,
              color: Colors.yellow,
              child: const RandomLines()),
        ),
      ),
    );
  }
}
