import 'package:flutter/material.dart';
import 'package:quest1/particle.dart';
import 'dart:math';

Offset PolarToCartesian(double speed, double theta) {
  return Offset(speed * cos(theta), speed * sin(theta));
}

class MyCanvas extends CustomPainter {
  Random rgn;
  List<MyParticle> particles;
  MyCanvas(this.rgn, this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    //update the objects
    this.particles.forEach((p) {
      var velocity = PolarToCartesian(p.speed, p.theta);
      var dx = p.position.dx + velocity.dx;
      var dy = p.position.dy + velocity.dy;
      //if either position falls outside the canvas
      // reinitialize them
      if (p.position.dx < 0 || p.position.dx > size.width) {
        dx = rgn.nextDouble() * size.width;
      }
      if (p.position.dy < 0 || p.position.dy > size.height) {
        dy = rgn.nextDouble() * size.height;
      }
      p.position = Offset(dx, dy);
    });

    //Paint the objects
    this.particles.forEach((p) {});
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
