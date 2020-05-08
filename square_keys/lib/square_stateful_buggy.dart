import 'package:flutter/material.dart';

import 'random_color.dart';

class Square extends StatefulWidget {
  Square({Key key}) : super(key: key);

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  Color color;

  @override
  void initState() {
    color = RandomColor.get();
    super.initState();
  }

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
  final squares = [Square(), Square()];

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
