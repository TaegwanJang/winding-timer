part of 'home_page.dart';

class _TimeCounter extends StatelessWidget {
  late WindingProvider _provider;

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<WindingProvider>(context);
    return ValueListenableBuilder<int>(
      valueListenable: _provider.seconds,
      builder: (_, seconds, __) {
        DateTime date = DateTime(0, 0, 0, 0, 0, seconds);
        return Text(DateFormat('mm:ss').format(date));
      },
    );
  }
}
