import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChangeNotifierProvider demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      //provide CounterModel to descendants
      home: ChangeNotifierProvider(
        create: (_) => CounterModel(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('HomePage rebuild');

    //look-up for CounterModel. Do not listen for changes.
    final model = Provider.of<CounterModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: CounterTextContainer()),
      body: Center(child: CounterTextContainer()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: model.increment, //invoke model action
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: model.decrement, //invoke model action
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
    print('CounterText rebuild');
    return Consumer<CounterModel>(
      builder: (context, model, child) {
        print('CounterText.Consumer builder rebuild');
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              child,
              const SizedBox(width: 5),
              Text('Count: ${model.count}') // CounterText
            ],
          ),
        );
      },
      // child widget is not rebuilt when model changes
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.computer),
      ),
    );
  }
}
