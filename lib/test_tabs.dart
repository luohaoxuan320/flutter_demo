import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'TAB切换',
//  home: MyTabView(),
      home: MyDefaultTabView(),
    ));

class MyDefaultTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('MyDefaultTabView'),
            bottom: new TabBar(tabs: [
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.add)),
              Tab(icon: Icon(Icons.airport_shuttle))
            ]),
          ),
          body: new TabBarView(
            children: [FirstTab(), SecondTab(), ThirdTab()],
          ),

          ///底部导航
          /*bottomNavigationBar: Material(
            color: Colors.blue,
            child: new TabBar(tabs: [
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.add)),
              Tab(icon: Icon(Icons.airport_shuttle))
            ],
            ),
          ),*/
        ));
  }
}

class MyTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyTabViewState();
  }
}

class MyTabViewState extends State<MyTabView>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('TAB切换'),
      ),
      body: new TabBarView(
        children: [FirstTab(), SecondTab(), ThirdTab()],
        controller: tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: new TabBar(
          tabs: [
            Tab(icon: Icon(Icons.favorite)),
            Tab(icon: Icon(Icons.add)),
            Tab(icon: Icon(Icons.airport_shuttle))
          ],
          controller: tabController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();

    super.dispose();
  }
}

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstTab'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            Icon(
              Icons.favorite,
              size: 160,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Column(
        children: <Widget>[
          Icon(
            Icons.add,
            size: 160,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ThirdTab'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            Icon(
              Icons.airport_shuttle,
              size: 160,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
