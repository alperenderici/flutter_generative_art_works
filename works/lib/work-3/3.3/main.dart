import 'package:flutter/material.dart';
import 'package:quest1/work-3/3.3/random_square.dart';

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
          title: const Text("d_art work 3.3"),
        ),
        body: const Center(
          child: RandomSquares(),
        ),
      ),
    );
  }
}
