import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text("d_art work 3"),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: AnimatedRandomCircles(),
            ),
            Positioned.fill(
              child: GestureDetector(
                child: AnimatedRandomLines(),
                behavior: HitTestBehavior.opaque,
              ),
            ),
            Positioned.fill(
              child: AnimatedRandomSquares(),
            ),
          ],
        ),
      ),
    );
  }
}

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
  double speedFactor = 1.0;
  double colorChangeSpeed = 0.0;

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
      speedFactor = 1.0 + (verticalDelta / 100);
    });
  }

  void updateHorizontalDelta(double delta) {
    setState(() {
      horizontalDelta = delta;
      colorChangeSpeed = horizontalDelta.abs() / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  duration: Duration(milliseconds: 500),
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
  double speedFactor = 1.0;
  double colorChangeSpeed = 0.0;

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
      speedFactor = 1.0 + (verticalDelta / 100);
    });
  }

  void updateHorizontalDelta(double delta) {
    setState(() {
      horizontalDelta = delta;
      colorChangeSpeed = horizontalDelta.abs() / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              final length = generateRandomValue(200);
              final thickness = generateRandomValue(10);
              final x = generateRandomValue(MediaQuery.of(context).size.width);
              final y = generateRandomValue(MediaQuery.of(context).size.height);
              final color = Colors.accents[index % Colors.accents.length]
                  .withOpacity(1.0 - (colorChangeSpeed * _animation.value));

              return Positioned(
                top: y + (verticalDelta * speedFactor),
                left: x,
                child: Transform.rotate(
                  angle: _animation.value * 2 * pi,
                  child: Container(
                    width: length,
                    height: thickness,
                    color: color,
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

class AnimatedRandomSquares extends StatefulWidget {
  const AnimatedRandomSquares({Key? key}) : super(key: key);

  @override
  _AnimatedRandomSquaresState createState() => _AnimatedRandomSquaresState();
}

class _AnimatedRandomSquaresState extends State<AnimatedRandomSquares>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final random = Random();
  double verticalDelta = 0.0;
  double horizontalDelta = 0.0;
  double speedFactor = 1.0;
  double colorChangeSpeed = 0.0;

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
      speedFactor = 1.0 + (verticalDelta / 100);
    });
  }

  void updateHorizontalDelta(double delta) {
    setState(() {
      horizontalDelta = delta;
      colorChangeSpeed = horizontalDelta.abs() / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              final size = generateRandomValue(200);
              final x = generateRandomValue(MediaQuery.of(context).size.width);
              final y = generateRandomValue(MediaQuery.of(context).size.height);
              final color = Colors.accents[index % Colors.accents.length]
                  .withOpacity(1.0 - (colorChangeSpeed * _animation.value));

              return Positioned(
                top: y + (verticalDelta * speedFactor),
                left: x,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: size,
                  height: size,
                  color: color,
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
