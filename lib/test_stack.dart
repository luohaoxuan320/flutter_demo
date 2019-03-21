import 'package:flutter/material.dart';
void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Stack"),
        ),
        body: new Stack(
          alignment: const Alignment(0, 0),//基于第一层居中对齐
          children: <Widget>[

            new CircleAvatar(
              backgroundColor: Colors.amber[100],
              backgroundImage: new AssetImage("images/timg.jpg"),
              radius: 100,
            ),
            new Container(
              child: new Text("这是上面一层"),
            )
          ],
        ),
      ),
    );
  }
  
}