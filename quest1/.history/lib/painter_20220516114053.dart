import 'package:flutter/material.dart';
import 'package:quest1/canvas.dart';


class MyPainter extends StatefulWidget {
  MyPainter({Key? key}) : super(key: key);


  @override
  State<MyPainter> createState() => _MyPainter();
}

class _MyPainter extends State<MyPainter> {
  List 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
      child: Container(), 
      painter: MyCanvas(),)
    );
  }
}