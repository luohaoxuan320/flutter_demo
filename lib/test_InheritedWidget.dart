import 'package:flutter/material.dart';

class AppState {
  int _count = 0;

  get count => _count;

  void increment() {
    _count++;
  }
}

class _InheritedAppStateContainer extends InheritedWidget {
  final AppState appState;

  _InheritedAppStateContainer(
      {Key key, @required this.appState, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedAppStateContainer oldWidget) {
    // TODO: implement updateShouldNotify
    return appState != oldWidget.appState;
  }
}

class AppStateContainer extends StatefulWidget {
  final AppState appState;
  final Widget child;

  AppStateContainer({this.appState, @required this.child});

  static AppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedAppStateContainer)
            as _InheritedAppStateContainer)
        .appState;
  }

  @override
  AppStateContainerState createState() {
    // TODO: implement createState
    return AppStateContainerState();
  }
}

class AppStateContainerState extends State<AppStateContainer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _InheritedAppStateContainer(
        appState: widget.appState, child: widget.child);
  }
}

void main() => runApp(AppStateContainer(
    appState: AppState(),
    child: MaterialApp(
      home: TopScreen(),
    )));

class TopScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print("TopScreen createState");

    return TopScreenState();
  }
}

class TopScreenState extends State<TopScreen> {
  AppState appState;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('TopScreenState didChangeDependencies');
    if (appState == null) {
      appState = AppStateContainer.of(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("TopScreenState build");

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("count=${appState.count}"),
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
          appState.increment();
          setState(() {});
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

    AppState appState = AppStateContainer.of(context);
    // TODO: implement build

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("count=${appState.count}"),
            RaisedButton(
              child: Text("SecendPage"),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen())),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => appState.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
