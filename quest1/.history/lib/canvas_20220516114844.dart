import 'package:flutter/material.dart';
import 'package:quest1/particle.dart';

class MyCanvas extends CustomPainter {
  MyCanvas(List<MyParticle> particles);

  @override
  void paint(Canvas canvas, Size size) {
    var dx = size.width / 2;
    var dy = size.height / 2;
    var c = Offset(dx, dy);

    var radius = 100.0;
    var paint = Paint();
    paint.color = Colors.red;
    canvas.drawCircle(c, radius, paint);
  }

  @override
  bool shouldREpaint(CustomPainter o) {
    return true;
  }
}
