import 'package:flutter/material.dart';
import 'package:quest1/particle.dart';
import 'dart:math';

Offset polarToCartesian(double speed, double theta) {
  return Offset(speed * cos(theta), speed * sin(theta));
}

class MyCanvas extends CustomPainter {
  Random rgn;
  double animValue;
  List<MyParticle> particles;
  MyCanvas(this.rgn, this.particles, this.animValue);

  @override
  void paint(Canvas canvas, Size size) {
    //update the objects
    this.particles.forEach((p) {
      var velocity = polarToCartesian(p.speed, p.theta);
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

    Color _randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    //Paint the objects
    this.particles.forEach((p) {
      var paint = Paint();
      paint.color = Colors.orange;

      canvas.drawCircle(p.position, p.radius, paint);
    });

    // var dx = size.width / 2;
    // var dy = size.height / 2;
    // var c = Offset(dx, dy);

    // var radius = 100.0;
    // var paint = Paint();
    // paint.color = Colors.red;
    // canvas.drawCircle(c, radius, paint);
  }

  // @override
  // bool shouldREpaint(CustomPainter o) {
  //   return true;
  // }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  // @override
  // noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
