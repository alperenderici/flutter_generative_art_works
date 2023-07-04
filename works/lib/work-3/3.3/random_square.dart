import 'package:flutter/material.dart';
import 'dart:math';

class RandomSquares extends StatelessWidget {
  const RandomSquares({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SquarePainter(),
    );
  }
}

class SquarePainter extends CustomPainter {
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
      final sideLength = random.nextDouble() * 100;
      final x = random.nextDouble() * (size.width - sideLength);
      final y = random.nextDouble() * (size.height - sideLength);
      final color = colors[random.nextInt(colors.length)];

      final paint = Paint()..color = color;
      canvas.drawRect(
          Rect.fromLTWH(
            x,
            y,
            sideLength,
            sideLength,
          ),
          paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
