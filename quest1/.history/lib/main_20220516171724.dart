import 'package:flutter/material.dart';
import 'package:quest1/painter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.yellow[50],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPainter(),
    );
  }
}


