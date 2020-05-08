import 'package:flutter/material.dart';

// Working stateless example
//import 'square_stateless.dart';

// Buggy stateful example
//import 'square_stateful_buggy.dart';

// Working stateful example
import 'square_stateful_working.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SquaresPage(),
    );
  }
}
