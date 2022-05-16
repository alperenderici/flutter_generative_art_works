import 'package:flutter/material.dart';
import 'package:quest1/canvas.dart';
import 'package:quest1/particle.dart';
import 'dart:math';

class MyPainter extends StatefulWidget {
  MyPainter({Key? key}) : super(key: key);

  @override
  State<MyPainter> createState() => _MyPainter();
}

Color getRandomColor(Random rgn) {
  var a = rgn.nextInt(255);
  var r = rgn.nextInt(255);
  var g = rgn.nextInt(255);
  var b = rgn.nextInt(255);
  return Color.fromARGB(a, r, g, b);
}

double maxRadius = 6;
double 

class _MyPainter extends State<MyPainter> {
  List<MyParticle> particles;
  Random rgn = Random(100);

  @override
  void initState() {
    super.initState();
    this.particles = List<Particle>(10);
    this.particles.forEach((element) {
      element.color = getRandomColor(rgn);
      element.position = Offset(0, 0);
      element.speed = rgn.nextDouble() * 0.2;
      element.theta = rgn.nextDouble() * 2.0 * pi;
      element.radius = rgn.nextDouble() * maxRadius;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      child: Container(),
      painter: MyCanvas(particles),
    ));
  }
}
