import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      routes: {
        "/setttings": (BuildContext context) => SettingScreen(),
        "/person": (BuildContext context) => PersonScreen(),
      },
    ));

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Drawer getNavDrawer() {
    var header = DrawerHeader(
      child: Text('Header'),
    );
    var aboutChild = AboutListTile(
      child: Text('About'),
      applicationName: "applicationName",
      applicationVersion: "applicationVersion",
      applicationIcon: Icon(Icons.adb),
      icon: Icon(Icons.info),
    );

    ListTile getNavItem(icon, title, routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () => setState(() {
              ///不调用这个会怎样
//          Navigator.of(context).pop();
              Navigator.of(context).pushNamed(routeName);
            }),
      );
    }

    var myNavChidren = [
      header,
      getNavItem(Icons.settings, "Settings", "/setttings"),
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.account_circle, "Person", "/person"),
      aboutChild
    ];

    return Drawer(
      child: ListView(
        children: myNavChidren,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("侧边导航栏"),
      ),
      body: Center(
        child: Text("Homepager"),
      ),
      drawer: getNavDrawer(),
    );
  }
}

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: new Center(
        child: Text('我的设置'),
      ),
    );
  }
}

class PersonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('个人'),
      ),
      body: new Center(
        child: Text('个人页'),
      ),
    );
    ;
  }
}
