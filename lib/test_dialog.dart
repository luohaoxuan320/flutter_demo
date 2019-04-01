import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('弹框'),
        ),
        body: MyHome(),
      ),
    ));

class MyHome extends StatelessWidget {
  AlertDialog dialog = AlertDialog(
    content: new Text("我是弹框"),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Center(
        child: RaisedButton(
          onPressed: () =>
              showDialog(context: context, builder: (context) => dialog),
          child: new Text('点我啊'),
        ),
      ),
    );
  }
}
