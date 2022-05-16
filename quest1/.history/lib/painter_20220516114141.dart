import 'package:flutter/material.dart';
import 'package:quest1/canvas.dart';
import 'package:quest1/particle.dart';

class MyPainter extends StatefulWidget {
  MyPainter({Key? key}) : super(key: key);

  @override
  State<MyPainter> createState() => _MyPainter();
}

class _MyPainter extends State<MyPainter> {
  List<MyParticle> particles;
  Random rgn = Random(100);
  
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      child: Container(),
      painter: MyCanvas(),
    ));
  }
}
