import 'package:flutter/material.dart';

void main(){
  runApp(new MyGridView());
}
class MyGridView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home:new Scaffold(
        appBar: new AppBar(
          title: new Text('GridView'),
        ),
//        body: buildGridExtent(),
        body: buildGridCount(),
      )
    );
  }
  

}

Widget buildGridExtent() {
  //限定了最大的宽度，然后自动计算一行放几个
  return new GridView.extent(maxCrossAxisExtent: 300,
  mainAxisSpacing: 4,crossAxisSpacing: 8,
    children: new List.generate(20, (index)=>new Image.asset("images/timg.jpg",fit: BoxFit.cover,)),
  );
}
Widget buildGridCount() {
  //限定一行放几个
  return new GridView.count(crossAxisCount:3,
    mainAxisSpacing: 4,crossAxisSpacing: 8,
    children: new List.generate(20, (index)=>new Image.asset("images/timg.jpg",fit: BoxFit.cover,)),
  );
}
