import 'package:flutter/material.dart';
void main()=> runApp(new MyApp());
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyAppState();
  }

}

class MyAppState extends State<MyApp> {

  List _fruites=["Apple","Banana","Pineapple","Mango","Grapes"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  String _selFruite;

  @override
  void initState() {
    // TODO: implement initState
    _dropDownMenuItems=buildAndGetDropDownItems(_fruites);
    _selFruite=_dropDownMenuItems[0].value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(title: new Text("下拉选择Demo"),),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text("请选择："),
                new DropdownButton(
                  value:_selFruite ,
                  items: _dropDownMenuItems, onChanged: (newValue){
                  setState((){
                    _selFruite=newValue;
                  });
                },)
              ],
            ),),

        ),
      ),

    );
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownItems(List fruites) {
    List<DropdownMenuItem<String>> items=new List();
    for (String fruit in fruites) {
      items.add(new DropdownMenuItem(child: new Text("水果:"+fruit),value:fruit));
    }
    return items;

  }

}
