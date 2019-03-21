import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home:new Scaffold(
        appBar: new AppBar(
        title: new Text("侧滑删除"),
      ),
          body:new ListView.builder(
              itemCount: 20,
              itemBuilder: (context,i){
                return new Dismissible(key: new Key(i.toString()), child: new ListTile(
                  title: new Text("Item $i"),
                ),
                onDismissed:(direction){
                  print("删除 index=$i");
                },
                  background: new Container(color: Colors.red,),
                );
              }) ,


    ));
  }



}