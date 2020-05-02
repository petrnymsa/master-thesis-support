import 'package:flutter/material.dart';

class _CounterModelInherited extends InheritedWidget {
  _CounterModelInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final CounterInheritedWidgetState data;

  @override
  bool updateShouldNotify(_CounterModelInherited oldWidget) {
    return true;
  }
}

class CounterInheritedWidget extends StatefulWidget {
  CounterInheritedWidget({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  CounterInheritedWidgetState createState() =>
      new CounterInheritedWidgetState();

  static CounterInheritedWidgetState of(BuildContext context,
      {bool listen = true}) {
    return (listen
            ? context
                .dependOnInheritedWidgetOfExactType<_CounterModelInherited>()
            : context.findAncestorWidgetOfExactType<_CounterModelInherited>())
        .data;
  }
}

class CounterInheritedWidgetState extends State<CounterInheritedWidget> {
  int _count = 0;
  int get count => _count;

  void increment() {
    setState(() {
      _count++;
    });
  }

  void decrement() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _CounterModelInherited(
      data: this,
      child: widget.child,
    );
  }
}
