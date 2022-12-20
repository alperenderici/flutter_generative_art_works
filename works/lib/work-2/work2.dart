import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: CircleGenerativeArt(),
    ),
  );
}

class CircleGenerativeArt extends StatefulWidget {
  @override
  _CircleGenerativeArtState createState() => _CircleGenerativeArtState();
}

class _CircleGenerativeArtState extends State<CircleGenerativeArt> {
  final Random random = Random();
  Color getRandomColor(Random rgn) {
    var a = rgn.nextInt(255);
    var r = rgn.nextInt(255);
    var g = rgn.nextInt(255);
    var b = rgn.nextInt(255);
    return Color.fromARGB(a, r, g, b);
  }

  double getSize(Random rdm) {
    double size = rdm.nextDouble() * 100;
    return size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: CirclePainter(
            color: getRandomColor(random),
            size: getSize(random),
          ),
          child: Container(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Regenerate the circle when the button is pressed
          setState(() {
            getRandomColor(random);
            getSize(random);
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter({
    required this.color,
    required this.size,
  });

  final Color color;
  final double size;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, this.size, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
