part of 'home_page.dart';

class _SwipeGestureDetector extends StatelessWidget {
  late WindingProvider _provider;
  final double width;
  final double height;
  final EdgeInsets padding;
  final double secondHandWidth = 10;

  _SwipeGestureDetector({
    super.key,
    required this.width,
    required this.height,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<WindingProvider>(context);
    return Padding(
      padding: padding,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (details) =>
            _provider.handleTapDown(details, width, height, secondHandWidth),
        onTapUp: (_) => _provider.handleTapCancelled(),
        onVerticalDragUpdate: _provider.handleDragUpdatePosition,
        onVerticalDragEnd: (_) => _provider.handleDragCancelled(),
        onVerticalDragCancel: _provider.handleDragCancelled,
        child: SizedBox(
          width: width,
          height: height,
          child: ValueListenableBuilder<double>(
            valueListenable: _provider.angle,
            builder: (_, angle, __) {
              return TimerProgressWidget(
                angle: angle,
                secondHandWidth: secondHandWidth,
              );
            },
          ),
        ),
      ),
    );
  }
}
