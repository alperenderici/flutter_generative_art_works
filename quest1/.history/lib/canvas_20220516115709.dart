import 'package:flutter/material.dart';
import 'package:quest1/particle.dart';
import 'dart:math';


class MyCanvas extends CustomPainter {
  MyCanvas(List<MyParticle> particles);

  @override
  void paint(Canvas canvas, Size size) {
    //update the objects
    this.particles.forEach((p) {
      var velocity = PolarToCartesian(p.speed, p.theta);
      var dx = p.position.dx + velocity.dx;
      var dy = p.position.dy + velocity.dy;
      //if either position falls outside the canvas
      // reinitilaze them
      if (p.position.dx < 0 || p.position.dx > size.width) {
        dx = rgn.nextDouble() * size.width;
      }
      if (p.position.dy < 0 || p.position.dy > size.height) {
        dy = rgn.nextDouble() * size.height;
      }
      p.position = Offset
    });

    //Paint the objects
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