import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedRandomCircles extends StatefulWidget {
  const AnimatedRandomCircles({Key? key}) : super(key: key);

  @override
  _AnimatedRandomCirclesState createState() => _AnimatedRandomCirclesState();
}

class _AnimatedRandomCirclesState extends State<AnimatedRandomCircles>
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
          return Stack(
            children: List.generate(100, (index) {
              final radius = generateRandomValue(50);
              final x = generateRandomValue(MediaQuery.of(context).size.width);
              final y = generateRandomValue(MediaQuery.of(context).size.height);
              final color = Colors.accents[index % Colors.accents.length]
                  .withOpacity(1.0 - (colorChangeSpeed * _animation.value));

              return Positioned(
                top: y + (verticalDelta * speedFactor),
                left: x,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: radius,
                  height: radius,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
