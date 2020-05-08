import 'package:flutter/material.dart';

import 'random_color.dart';

class Square extends StatelessWidget {
  final Color color;
  const Square(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 100,
      height: 100,
    );
  }
}

class SquaresPage extends StatefulWidget {
  @override
  _SquaresPageState createState() => _SquaresPageState();
}

class _SquaresPageState extends State<SquaresPage> {
  final squares = [Square(RandomColor.get()), Square(RandomColor.get())];

  void _shiftSquares() {
    setState(
      () => squares.insert(1, squares.removeAt(0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: squares,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _shiftSquares,
          child: Icon(Icons.all_inclusive),
        ),
      ),
    );
  }
}
