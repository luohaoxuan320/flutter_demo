import 'package:flutter/material.dart';
import 'package:flutter_app/grid_layout.dart';
import 'package:dio/dio.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Builder(builder: (context)=>Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text('跳到GridView'),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyGridView())),
            ),
            RaisedButton(
                child: Text('跳转并带参数'),
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen("我是传过来的参数，点我呀"))).then((result){
                  print("返回值:$result");
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text(result)));
                })),
            RaisedButton(
              child: Text('跳到登录页'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginInputText())),
            ),
            RaisedButton(
              child: Text('跳到动画页'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MyAnimationPage())),
            ),
            RaisedButton(
              child: Text('跳到透明显示隐藏页'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OpacityPager())),
            ),
            RaisedButton(
              child: Text('获取天气'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WeatherPager())),

            )
          ],
        ),
      ),
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondScreen extends StatelessWidget{
  
  final String params;


  SecondScreen(this.params);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    //多MaterialApp这一层，将不会主动显示返回icon
//      new MaterialApp(home:
        new Scaffold(
        appBar: new AppBar(
          title: new Text('SecondPage'),
        ),
        body: new Center(
          child: new RaisedButton(
              child: new Text("$params"),
              onPressed: ()=>Navigator.pop(context,'我是返回值')),
        ),
//      ),
    );
  }

}


///
/// 测试输入
///
class LoginInputText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginInputState();
  }

}


class LoginInputState extends State<LoginInputText> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("登录"),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: TextField(
                decoration: new InputDecoration(
                  hintText: '请输入用户名',
                ),
                controller: controller,
                onChanged: (newValue) => print("inputValue=$newValue"),
              ),
            ),
            RaisedButton(
              onPressed: () =>
              {
              showDialog(context: context, child: new AlertDialog(
                title: Text("用户名"),
                content: new Text(controller.text),
              ))
              },
              child: Text('登录'),
            )
          ],
        ),
      ),
    );;
  }

}


///动画
///
///
class MyAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: Text("测试动画"),
        ),
        body: new MyAnimation()
    );
  }

}

///
class MyAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyAnimationState();
  }


}

class MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 5000)
    );
    _animation = Tween(
        begin: 0.0,
        end: 300.0
    ).animate(_controller)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
//      ..addListener(()=>setState((){print("animation value=${_animation.value}");}));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build value=${_animation.value}");
    return new AnimationBuilder(_animation);
//    return new AnimatedLogo(_animation);

    /* return  new Center(
        child: Container(
//          margin: const EdgeInsets.symmetric(vertical:10.0),
          height: _animation.value,
          width: _animation.value,
          child:FlutterLogo(),
//          child: Image.asset("images/timg.jpg"),
        ),
    );*/
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;

    return new Center(
      child: Container(
//          margin: const EdgeInsets.symmetric(vertical:10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
//          child: Image.asset("images/timg.jpg"),
      ),
    );
  }

  AnimatedLogo(Animation<double> animation) :super(listenable: animation);

}

class AnimationBuilder extends StatelessWidget {
  Animation<double> animation;

  AnimationBuilder(this.animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new AnimatedBuilder(
          animation: animation, builder: (BuildContext context, Widget child) {
        return new Container(
          height: animation.value,
          width: animation.value,
          child: FlutterLogo(),
        );
      }),
    );
  }

}

class OpacityPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("透明度控制显示隐藏"),
      ),
      body: new OpacityApp(),
    );
  }

}

///透明度控制隐藏显示

class OpacityApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new OpacityAppState();
  }

}

class OpacityAppState extends State<OpacityApp> {
  var _visible = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Opacity(opacity: _visible ? 1.0 : 0.0,
      child: new Center(
        child: new RaisedButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
          child: new Text("别说话，点我"),
        ),
      ),
    );
  }
}

///获取网络请求

class WeatherPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("获取天气"),
      ),
      body: new Center(
        child: new RaisedButton(
            child: Text('获取天气'),
            onPressed: () {
              Dio().get(
                  "https://free-api.heweather.com/s6/weather/now?parameters",
                  queryParameters: {"location": "深圳",
                    "key": "eaf572c8304f4eeb8ad209bf05da2872",}).then((
                  onValue) {
                print("$onValue");
              }, onError: (error) {
                print("error=$error");
              });
            }),
      ),
    );
  }

}