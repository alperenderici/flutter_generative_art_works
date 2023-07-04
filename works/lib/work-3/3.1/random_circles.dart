import 'package:flutter/material.dart';
import 'dart:math';

class RandomCircles extends StatelessWidget {
  const RandomCircles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = Random();
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
    ];

    for (int i = 0; i < 100; i++) {
      final radius = random.nextDouble() * 50;
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final color = colors[random.nextInt(colors.length)];

      final paint = Paint()..color = color;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
