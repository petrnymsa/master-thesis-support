import 'package:counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CounterTextContainer()),
      body: Center(child: CounterTextContainer()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () =>
                context.bloc<CounterBloc>().add(CounterEvent.increment),
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () =>
                context.bloc<CounterBloc>().add(CounterEvent.decrement),
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
          const Icon(Icons.computer),
          const SizedBox(width: 5),
          BlocBuilder<CounterBloc, int>(
            builder: (context, state) => Text('Count: $state'),
          )
        ],
      ),
    );
  }
}
