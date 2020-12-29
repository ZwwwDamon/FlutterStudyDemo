import 'package:flutter/material.dart';
import 'package:flutterstudyapp/first_app/route_demo.dart';

class CounterDemoPage extends StatefulWidget {
  final String title;

  CounterDemoPage({Key key, this.title}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(title: new Text(widget.title)),
      body: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            new Text("You have pushed the button this many times:"),
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
