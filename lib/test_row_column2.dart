import 'package:flutter/material.dart';

/**
 * 在flutter中构建布局

 * flutter的布局机制如何工作
 * 如何垂直和水平布局widget
 *如何构建一个flutter布局
 */
void main() {
  runApp(new MaterialApp(
    title: "",
    home: new MyApp(),
  ));
}

/**
 * 实现标题行
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /**
     * 整合
     */
    return new MaterialApp(
      title: "Flutter Layout",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter Layout"),
        ),
        body:        new Container(
          child: new Column(
            children: <Widget>[
              new Image.asset("images/timg.jpg",height: 260,fit: BoxFit.cover,),
            titleRow,
            buttonRow
            ],

          ),
        )
      ),
    );
  }
}

Widget titleRow=new Container(
  padding: const EdgeInsets.all(16),
  child: new Row(
    children: <Widget>[
      new Expanded(
        child:
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[new Text("这是标题行"),
          new Container(
            padding: EdgeInsets.only(top: 8),
            child: new Text("这是summary"),
          )
          ],
        ),
      ),
      new Icon(
        Icons.star,
        color: Colors.red,
      ),
      new Text("44"),
    ],
  ),
);

Widget buttonRow=new Container(
  child: new Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      actionColumn(Icons.call, '打电话打电话'),
      actionColumn(Icons.near_me, '导航导航'),
      actionColumn(Icons.share, '分享')

    ],
  ),
);


Widget actionColumn(IconData icon,String title){
  return new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Icon(icon,color: Colors.blue,),
      new Container(
        margin: const EdgeInsets.only(top: 8),
        child: new Text(
          title,
          style: new TextStyle(
            color: Colors.blue
          ),
        ),
      )
    ],
  );
}