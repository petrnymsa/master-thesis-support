import 'package:flutter/material.dart';
import 'model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InheritedWidget demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterModelProvider(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = CounterModelProvider.of(context, listen: false);
    print('HomePage rebuild');
    return Scaffold(
        appBar: AppBar(title: CounterTextContainer()),
        body: Center(child: CounterTextContainer()),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: model.increment,
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: model.decrement,
              child: Icon(Icons.remove),
            )
          ],
        ));
  }
}

class CounterTextContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('CounterTextContainer rebuild');
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
    final CounterModel model = CounterModelProvider.of(context);
    return Text(model.count.toString());
  }
}
