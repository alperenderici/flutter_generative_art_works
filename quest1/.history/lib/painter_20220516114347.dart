import 'package:flutter/material.dart';
import 'package:quest1/canvas.dart';
import 'package:quest1/particle.dart';

class MyPainter extends StatefulWidget {
  MyPainter({Key? key}) : super(key: key);

  @override
  State<MyPainter> createState() => _MyPainter();
}

Color Get

class _MyPainter extends State<MyPainter> {
  List<MyParticle> particles;
  Random rgn = Random(100);

  @override
  void initState() {
    super.initState();
    this.particles = List<Particle>(10);
    this.particles.forEach((element) {
      var a = rgn.nextInt(255);
      var r = rgn.nextInt(255);
      var g = rgn.nextInt(255);
      var b = rgn.nextInt(255);
      element.color = Color.fromARGB(a, r, g, b);
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