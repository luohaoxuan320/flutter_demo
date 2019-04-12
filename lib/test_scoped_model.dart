import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(ScopedModel<CountModel>(
      model: CountModel(),
      child: MaterialApp(
        home: TopScreen(),
      ),
    ));

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TopScreen build");
    // TODO: implement build
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("count=${model.count}"),
                RaisedButton(
                  child: Text("SecendPage"),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen())),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
//      rebuildOnChange: false,
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final countModle = ScopedModel.of<CountModel>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("count=${countModle.count}"),
            RaisedButton(
              child: Text("SecendPage"),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TopScreen())),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => countModle.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CountModel extends Model {
  int _count = 0;

  get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
