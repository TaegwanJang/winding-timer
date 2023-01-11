import 'dart:math';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:winding_timer/provider/winding_provider.dart';

part '_swipe_gesture_detector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
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
              child: _SwipeGestureDetector(
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxWidth,
                  child: _buildCrossWidget(),
                ),
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
