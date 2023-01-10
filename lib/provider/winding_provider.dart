import 'package:flutter/foundation.dart';

class WindingProvider extends ChangeNotifier {
  final WindingCoordinate center;
  late final WindingCoordinate start;
  Duration time = Duration.zero;

  WindingProvider(this.center) {
    start = WindingCoordinate(x: center.x, y: 0);
  }
}

class WindingCoordinate {
  final double x;
  final double y;

  WindingCoordinate({this.x = 0, this.y = 0});
}
