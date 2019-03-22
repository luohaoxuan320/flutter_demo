import 'package:flutter/material.dart';
void main()=>runApp(new MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("测试点击事件"),
        ),
        body: new Center(
          child: new GestureDetector(
            onTap: ()=>print("点击"),
            onDoubleTap: ()=>print("双击"),
            onLongPress: ()=>print("长按"),
            child: new Container(
              height: 36,
              padding: const EdgeInsets.all(8),
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(6),
                  color: Colors.blueAccent
              ),
              child: new Text("BUTTON"),
            ),
          ),
        ),
      ),
    );
  }

}
