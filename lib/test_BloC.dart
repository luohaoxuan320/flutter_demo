import 'dart:async';
import 'package:flutter/material.dart';

class CountBLoC {
  int _count;
  StreamController<int> _controller;

  CountBLoC() {
    _count = 0;
    _controller = StreamController<int>.broadcast();
  }

  Stream<int> get stream => _controller.stream;

  int get value => _count;
  increment() {
    _controller.sink.add(++_count);
  }

  dispose() {
    _controller.close();
  }
}

class BlocProvider extends InheritedWidget {
  final CountBLoC countBLoC = CountBLoC();

  BlocProvider({Key key, Widget child}) :super(key: key, child: child);

  static CountBLoC of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
          .countBLoC;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

}


void main() =>
    runApp(BlocProvider(child: MaterialApp(
      home: TopScreen(),
    )));

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TopScreen build");

    CountBLoC countBLoC = BlocProvider.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(stream: countBLoC.stream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text("count=${snapshot.data}");
              },),
            RaisedButton(
              child: Text("SecendPage"),
              onPressed: () =>
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen())),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countBLoC.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("SecondScreen build");

    CountBLoC countBLoC = BlocProvider.of(context);
    // TODO: implement build

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(stream: countBLoC.stream,
              initialData: countBLoC.value,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text("count=${snapshot.data}");
              },),
            RaisedButton(
              child: Text("SecendPage"),
              onPressed: () =>
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen())),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => countBLoC.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

