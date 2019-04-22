import 'dart:async';
import 'package:flutter/material.dart';

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final Widget child;
  final T bloc;

  BlocProvider({Key key, @required this.child, @required this.bloc});

  @override
  State<StatefulWidget> createState() => _BlocProviderState<T>(); //这里要注意加<T>

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<_BlocProviderInherited<T>>();
    _BlocProviderInherited<T> provider =
        context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return provider?.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    // TODO: implement dispose
    widget.bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("child=${widget.child}  bloc=${widget.bloc}");
    //这里的<T>不能少，否则会找不到null
    // 即这样_BlocProviderInherited(child: widget.child, bloc: widget.bloc);
    return _BlocProviderInherited<T>(child: widget.child, bloc: widget.bloc);
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  final T bloc;

  _BlocProviderInherited({Key key, @required Widget child, @required this.bloc})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }
}

class CountBLoC extends BlocBase {
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

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.close();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountBLoC>(
        bloc: CountBLoC(),
        child: MaterialApp(
          home: TopScreen(),
        ));
  }
}

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TopScreen build");

    CountBLoC countBLoC = BlocProvider.of<CountBLoC>(context);
    print("countBLoC=$countBLoC");

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: countBLoC.stream,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text("count=${snapshot.data}");
              },
            ),
            RaisedButton(
              child: Text("SecendPage"),
              onPressed: () => Navigator.push(context,
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
            StreamBuilder<int>(
              stream: countBLoC.stream,
              initialData: countBLoC.value,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text("count=${snapshot.data}");
              },
            ),
            RaisedButton(
              child: Text("SecendPage"),
              onPressed: () => Navigator.push(context,
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
