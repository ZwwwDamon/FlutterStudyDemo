import 'package:flutter/material.dart';

class CounterDemoPage extends StatefulWidget {
  @override
  _CounterDemoPageState createState() => _CounterDemoPageState();
}

class _CounterDemoPageState extends State<CounterDemoPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: new Text(title)),
      body: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            new Text("点击右下方按钮可让数字自增"),
            new Text("$_counter", style: Theme.of(context).textTheme.headline4)
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: new Icon(Icons.add),
      ),
    );
  }
}
