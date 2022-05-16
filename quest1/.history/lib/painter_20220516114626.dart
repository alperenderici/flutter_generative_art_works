import 'package:flutter/material.dart';
import 'package:quest1/canvas.dart';
import 'package:quest1/particle.dart';
import 'dart:math';

class MyPainter extends StatefulWidget {
  MyPainter({Key? key}) : super(key: key);

  @override
  State<MyPainter> createState() => _MyPainter();
}

Color GetRandomColor(Random rgn) {
  var a = rgn.nextInt(255);
  var r = rgn.nextInt(255);
  var g = rgn.nextInt(255);
  var b = rgn.nextInt(255);
  return Color.fromARGB(a, r, g, b);
}

class _MyPainter extends State<MyPainter> {
  List<MyParticle> particles;
  Random rgn = Random(100);

  @override
  void initState() {
    super.initState();
    this.particles = List<Particle>(10);
    this.particles.forEach((element) {
      element.color = GetRandomColor(rgn);
      element.position = Offset(0, 0);
      element.speed = rgn.nextDouble()
    });
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
