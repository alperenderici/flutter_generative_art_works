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

class _MyPainter extends State<MyPainter> with SingleTickerProviderStateMixin {
  late List<MyParticle> particles;
  late Animation<double> animation;
  late AnimationController controller;
  Random rgn = Random(DateTime.now().millisecondsSinceEpoch);

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 10), vsync: this);

    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();

    this.particles = List.generate(2000, (index) {
      var p = MyParticle(
          position: Offset(-1, 10),
          color: getRandomColor(rgn),
          speed: rgn.nextDouble() * maxSpeed,
          theta: rgn.nextDouble() * maxTheta,
          radius: rgn.nextDouble() * maxRadius);
      p.color = getRandomColor(rgn);
      p.position = Offset(-1, -1);
      p.speed = rgn.nextDouble() * maxSpeed;
      p.theta = rgn.nextDouble() * maxTheta;
      p.radius = rgn.nextDouble() * maxRadius;
      return p;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomPaint(
          child: Container(),
          painter: MyCanvas(rgn, particles, animation.value),
        ));
  }
}
