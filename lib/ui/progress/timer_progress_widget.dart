import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimerProgressWidget extends StatefulWidget {
  final double angle;
  final double borderWidth;
  final double secondHandWidth;

  const TimerProgressWidget({
    super.key,
    this.angle = 0,
    this.borderWidth = 2,
    this.secondHandWidth = 2,
  });

  @override
  State<TimerProgressWidget> createState() => _TimerProgressWidgetState();
}

class _TimerProgressWidgetState extends State<TimerProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ProgressBarPainter(
        angle: widget.angle,
        borderWidth: widget.borderWidth,
        secondHandWidth: widget.secondHandWidth,
      ),
      child: Container(),
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  final double angle;
  final double borderWidth;
  final double secondHandWidth;

  _ProgressBarPainter({
    required this.angle,
    required this.borderWidth,
    required this.secondHandWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double circleRadius =
        (size.height >= size.width) ? size.width / 2 : size.height / 2;

    /// circle
    final Paint circlePaint = Paint()..color = Colors.black;
    canvas.drawCircle(
        Offset(
          size.width / 2,
          (size.height / 2),
        ),
        circleRadius,
        circlePaint);

    final Paint circlePaint2 = Paint()..color = Colors.white;
    canvas.drawCircle(
        Offset(
          size.width / 2,
          (size.height / 2),
        ),
        circleRadius - borderWidth,
        circlePaint2);

    final Paint secondHandPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = secondHandWidth;

    canvas.drawLine(
        Offset(size.width / 2, size.height / 2),
        Offset(cos(angle * pi / 180 - pi / 2) * circleRadius + size.width / 2,
            sin(angle * pi / 180 - pi / 2) * circleRadius + size.height / 2),
        secondHandPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
