part of 'home_page.dart';

class _SwipeGestureDetector extends StatelessWidget {
  late WindingProvider _provider;
  final double width;
  final double height;
  final EdgeInsets padding;

  _SwipeGestureDetector({
    super.key,
    required this.width,
    required this.height,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<WindingProvider>(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: _provider.dragUpdatePosition,
      onHorizontalDragUpdate: _provider.dragUpdatePosition,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        child: ValueListenableBuilder<double>(
          valueListenable: _provider.angle,
          builder: (_, angle, __) {
            return TimerProgressWidget(
              angle: angle,
            );
          },
        ),
        // child: TimerProgressWidget(),
      ),
    );
  }
}
