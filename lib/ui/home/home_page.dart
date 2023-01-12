import 'dart:math';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:winding_timer/provider/winding_provider.dart';
import 'package:winding_timer/ui/progress/timer_progress_widget.dart';

part '_swipe_gesture_detector.dart';
part '_time_counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            debugPrint(
                'width, height :: (${constraints.maxWidth} , ${constraints.maxHeight})');
            double centerX = constraints.maxWidth / 2;
            double centerY = centerX;

            return ChangeNotifierProvider(
              create: (context) => WindingProvider(
                WindingCoordinate(
                  x: centerX,
                  y: centerY,
                ),
              ),
              child: Column(
                children: [
                  _SwipeGestureDetector(
                    width: constraints.maxWidth,
                    height: constraints.maxWidth,
                    padding: EdgeInsets.all(10),
                  ),
                  _TimeCounter(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCrossWidget() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              const Spacer(),
              Container(
                width: 0.5,
                color: Colors.black,
              ),
              const Spacer(),
            ],
          ),
        ),
        Container(
          height: 0.5,
          color: Colors.black,
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              const Spacer(),
              Container(
                width: 0.5,
                color: Colors.black,
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
