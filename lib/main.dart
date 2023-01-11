import 'package:flutter/material.dart';
import 'package:winding_timer/ui/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Gesture Detector Test')),
//       body: Center(
//         child: GestureDetector(
// //          behavior: HitTestBehavior.deferToChild,
// //          behavior: HitTestBehavior.opaque,
// //          behavior: HitTestBehavior.translucent,
//           onTap: () {
//             print('----------------------first GD on tap');
//           },
//           child: Container(
//             width: 200,
//             height: 200,
//             color: Colors.amber,
//             child: GestureDetector(
//               behavior: HitTestBehavior.deferToChild,
//               // behavior: HitTestBehavior.opaque,
//               // behavior: HitTestBehavior.translucent,
//               onTap: () {
//                 print('----------------------second GD on tap');
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
