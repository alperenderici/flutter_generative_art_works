import 'package:flutter/material.dart';

class MyPainter extends StatefulWidget {
  MyPainter({Key? key}) : super(key: key);


  @override
  State<MyPainter> createState() => MyPainter();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
      child: Container(), 
      painter: MyCanvas(),)
    );
  }
}