import 'package:flutter/foundation.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class WindingProvider extends ChangeNotifier {
  final WindingCoordinate centerCoordinate;
  final isMove = ValueNotifier<bool>(false);
  final angle = ValueNotifier<double>(0);
  final seconds = ValueNotifier<int>(0);
  WindingCoordinate prevCoordinate = WindingCoordinate();
  WindingCoordinate tapCoordinate = WindingCoordinate();
  int prevQuadrant = 1;
  int currentQuadrant = 1;
  int roation = 0;
  Duration time = Duration.zero;

  WindingProvider(this.centerCoordinate);

  _onMove(WindingCoordinate tapCoordinate) {
    if (!isMove.value) return;

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
    if (this.angle.value ~/ 6 != seconds.value) {
      seconds.value = this.angle.value ~/ 6;
    }

    prevCoordinate = this.tapCoordinate;
    prevQuadrant = currentQuadrant;
    debugPrint('drag update :: angle :: ${this.angle.value}} $currentQuadrant');
  }

  handleDragUpdatePosition(DragUpdateDetails details) {
    _onMove(WindingCoordinate(
        x: details.localPosition.dx, y: details.localPosition.dy));
  }

  handleDragCancelled() {
    isMove.value = false;
  }

  handleTapDown(
      TapDownDetails details, double width, double height, double tapRange) {
    double angle = this.angle.value;
    double circleRadius = (height >= width) ? width / 2 : height / 2;
    // print('why?? ${details.localPosition.dx} ${details.localPosition.dy}');

    double centerX = width / 2;
    double centerY = height / 2;
    double vertexX = cos(angle * pi / 180 - pi / 2) * circleRadius + width / 2;
    double vertexY = sin(angle * pi / 180 - pi / 2) * circleRadius + height / 2;

    double rangeX = (cos(angle * pi / 180) * tapRange).abs();
    double rangeY = (sin(angle * pi / 180) * tapRange).abs();

    double minX;
    double maxX;
    double minY;
    double maxY;

    if (centerX >= vertexX) {
      minX = vertexX - rangeX;
      maxX = centerX + rangeX;
    } else {
      minX = centerX - rangeX;
      maxX = vertexX + rangeX;
    }

    if (centerY >= vertexY) {
      minY = vertexY - rangeY;
      maxY = centerY + rangeY;
    } else {
      minY = centerY - rangeY;
      maxY = vertexY + rangeY;
    }

    if (details.localPosition.dx >= minX && details.localPosition.dx <= maxX) {
      if (details.localPosition.dy >= minY &&
          details.localPosition.dy <= maxY) {
        isMove.value = true;
      }
    }
  }

  handleTapCancelled() {
    isMove.value = false;
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
