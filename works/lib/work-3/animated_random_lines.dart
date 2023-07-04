import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedRandomLines extends StatefulWidget {
  const AnimatedRandomLines({Key? key}) : super(key: key);

  @override
  _AnimatedRandomLinesState createState() => _AnimatedRandomLinesState();
}

class _AnimatedRandomLinesState extends State<AnimatedRandomLines>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final random = Random();
  double verticalDelta = 0.0;
  double horizontalDelta = 0.0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double generateRandomValue(double maxValue) {
    return random.nextDouble() * maxValue;
  }

  void updateVerticalDelta(double delta) {
    setState(() {
      verticalDelta = delta;
    });
  }

  void updateHorizontalDelta(double delta) {
    setState(() {
      horizontalDelta = delta;
    });
  }

  @override
  Widget build(BuildContext context) {
    final speedFactor = 1 + (verticalDelta.abs() / 100);
    final colorChangeSpeed = horizontalDelta.abs() / 100;

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        updateVerticalDelta(details.delta.dy);
      },
      onHorizontalDragUpdate: (details) {
        updateHorizontalDelta(details.delta.dx);
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return CustomPaint(
            painter: LinePainter(
              animationValue: _animation.value,
              verticalDelta: verticalDelta,
              horizontalDelta: horizontalDelta,
              speedFactor: speedFactor,
              colorChangeSpeed: colorChangeSpeed,
            ),
          );
        },
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final double animationValue;
  final double verticalDelta;
  final double horizontalDelta;
  final double speedFactor;
  final double colorChangeSpeed;

  LinePainter({
    required this.animationValue,
    required this.verticalDelta,
    required this.horizontalDelta,
    required this.speedFactor,
    required this.colorChangeSpeed,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final startX = size.width * 0.2;
    final endX = size.width * 0.8;
    final startY = size.height * 0.5 + verticalDelta * speedFactor;
    final endY = size.height * 0.5 + verticalDelta * speedFactor;

    paint.color =
        Colors.black.withOpacity(1.0 - (colorChangeSpeed * animationValue));
    paint.strokeWidth = 5;

    final path = Path();
    path.moveTo(startX, startY);
    path.lineTo(endX, endY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
