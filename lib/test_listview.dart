import 'package:flutter/material.dart';
void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("ListTitle"),
        ),
        body: new ListView.builder(
            itemCount: 20,
            itemBuilder: (context,i) {
          return new MyCardListTitle(i);
        }),
    ),
    );
  }
}

class MyCardListTitle extends StatefulWidget {
  final int  index;


  MyCardListTitle(this.index);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyCardState(index);
  }
}

class MyCardState extends State<MyCardListTitle>{
  var isChecked=false;
  final int index;
  MyCardState(this.index);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return new Card(
        child: new ListTile(
          title: new Text("这是标题"+index.toString()),
          subtitle: new Text('这是子标题'),
          leading: new Icon(Icons.email),
          trailing: new Checkbox(value: isChecked, onChanged: (newValue){
            setState(() {
              isChecked=newValue;
            });
          }),
        ),
      );

  }
}