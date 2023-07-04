import 'package:flutter/material.dart';
import 'package:quest1/work-3/3.1/random_circles.dart';

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
          title: const Text("d_art work-3.1"),
        ),
        body: const Center(
          child: RandomCircles(),
        ),
      ),
    );
  }
}
