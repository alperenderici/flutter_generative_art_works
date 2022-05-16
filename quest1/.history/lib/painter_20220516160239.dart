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
double maxSpeed = 0.2;
double maxTheta = 2.0 * pi;

class _MyPainter extends State<MyPainter> {
  List<MyParticle> particles;
  Random rgn = Random(DateTime.now().millisecondsSinceEpoch);

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));

    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          contoller.forward();
        }
      });
    controller.forward();

    this.particles = List.generate(100, (index) {
      var p = MyParticle();
      p.color = getRandomColor(rgn);
      p.position = Offset(-1, -1);
      p.speed = rgn.nextDouble() * maxSpeed;
      p.theta = rgn.nextDouble() * maxTheta;
      p.radius = rgn.nextDouble() * maxRadius;
      return p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      child: Container(),
      painter: MyCanvas(rgn, particles, anima),
    ));
  }
}
