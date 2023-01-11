import 'package:flutter/foundation.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class WindingProvider extends ChangeNotifier {
  final WindingCoordinate centerCoordinate;
  final isMove = ValueNotifier<bool>(false);
  final angle = ValueNotifier<double>(0);
  WindingCoordinate prevCoordinate = WindingCoordinate();
  WindingCoordinate tapCoordinate = WindingCoordinate();
  int prevQuadrant = 1;
  int currentQuadrant = 1;
  int roation = 0;
  Duration time = Duration.zero;

  WindingProvider(this.centerCoordinate);

  _onMove(WindingCoordinate tapCoordinate) {
    this.tapCoordinate = tapCoordinate;

    double dx = (tapCoordinate.x - centerCoordinate.x);
    double dy = (centerCoordinate.y - tapCoordinate.y);
    currentQuadrant = _getQuadrant(tapCoordinate);

    double angle = 0;
    if (currentQuadrant % 2 == 1) {
      angle = ((pi / 2 - atan(dy / dx)) + ((currentQuadrant - 1) * (pi / 2))) *
          180 /
          pi;
    } else {
      angle = (atan((dy / dx).abs()) + ((currentQuadrant - 1) * (pi / 2))) *
          180 /
          pi;
    }

    if (currentQuadrant == 1 && prevQuadrant == 4) {
      roation++;
    } else if (currentQuadrant == 4 && prevQuadrant == 1) {
      roation--;
      if (roation < 0) roation = 0;
    }

    this.angle.value = angle + roation * 360;

    prevCoordinate = this.tapCoordinate;
    prevQuadrant = currentQuadrant;
    debugPrint('drag update :: angle :: ${this.angle.value}} $currentQuadrant');
  }

  dragUpdatePosition(DragUpdateDetails details) {
    _onMove(WindingCoordinate(
        x: details.localPosition.dx, y: details.localPosition.dy));
  }

  int _getQuadrant(WindingCoordinate coordinate) {
    double dx = (coordinate.x - centerCoordinate.x);
    double dy = (centerCoordinate.y - coordinate.y);
    int quadrant = 1;
    if (dx >= 0 && dy >= 0) {
      quadrant = 1;
    } else if (dx >= 0 && dy < 0) {
      quadrant = 2;
    } else if (dx < 0 && dy < 0) {
      quadrant = 3;
    } else {
      quadrant = 4;
    }
    return quadrant;
  }
}

class WindingCoordinate {
  final double x;
  final double y;

  WindingCoordinate({this.x = 0, this.y = 0});
}
