import 'package:flutter/material.dart';

/// Defines InheritedWidget which can access CounterModel
class _CounterInherited extends InheritedWidget {
  _CounterInherited({Widget child, this.data}) : super(child: child);

  final CounterModel data;

  @override
  bool updateShouldNotify(_CounterInherited oldWidget) => true;
}

///Provides wrapper around CounterInherited and of method convetion to access CounterModel
class CounterModelProvider extends StatefulWidget {
  CounterModelProvider({this.child});

  final Widget child;

  @override
  CounterModel createState() => CounterModel();

  static CounterModel of(BuildContext context, {bool listen = true}) {
    return (listen
            ? context.dependOnInheritedWidgetOfExactType<_CounterInherited>()
            : context.findAncestorWidgetOfExactType<_CounterInherited>())
        .data;
  }
}

///CounterModel holds actual data and business logic
class CounterModel extends State<CounterModelProvider> {
  int _count = 0;
  int get count => _count;

  void increment() => setState(() => _count++);

  void decrement() => setState(() => _count--);

  @override
  Widget build(BuildContext context) {
    return _CounterInherited(data: this, child: widget.child);
  }
}
