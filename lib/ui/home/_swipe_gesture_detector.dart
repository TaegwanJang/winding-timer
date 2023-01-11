part of 'home_page.dart';

class _SwipeGestureDetector extends StatelessWidget {
  final Widget child;
  late WindingProvider _provider;

  _SwipeGestureDetector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<WindingProvider>(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: _provider.dragUpdatePosition,
      onHorizontalDragUpdate: _provider.dragUpdatePosition,
      child: child,
    );
  }
}
