import 'package:flutter/material.dart';
void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
//      title: "Flutter Demo",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Splash Screen Example"),
        ),
        body: new Center(
          child: new Text("Hello hello"),
        ),
      ),
    );
  }
}
