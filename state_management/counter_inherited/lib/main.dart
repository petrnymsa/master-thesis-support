import 'package:flutter/material.dart';
import 'model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InheritedWidget demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterInheritedWidget(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = CounterInheritedWidget.of(context, listen: false);
    print('HomePage rebuild');
    return Scaffold(
      appBar: AppBar(title: CounterTextContainer()),
      body: Center(child: CounterTextContainer()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: model.increment,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: model.decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterTextContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('CounterTextContainer rebuild');
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Count'),
          const SizedBox(width: 5),
          CounterText()
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('CounterText rebuild');
    final CounterInheritedWidgetState state =
        CounterInheritedWidget.of(context);
    return Text(state.count.toString());
  }
}

// class CounterTextIcon extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     print('CounterTextIcon rebuild');
//     return Container(
//       padding: const EdgeInsets.all(8.0),
//       child: Icon(Icons.insert_emoticon),
//     );
//   }
// }
