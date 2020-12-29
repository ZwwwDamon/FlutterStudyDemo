import 'package:flutter/material.dart';
import 'package:flutterstudyapp/first_app/route_demo.dart';

import 'first_app/counter_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "FlutterStudyDemo",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeDemoPage());
  }
}

class HomeDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterDemo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, new MaterialPageRoute(builder: (context) {
                    return new CounterDemoPage(
                      title: "计数器示例页",
                    );
                  }));
                },
                child: Text("打开计数器示例页")),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context, new MaterialPageRoute(builder: (context) {
                  return new NewRoute();
                }));
              },
              child: Text("打开路由示例页"),
            )
          ],
        ),
      ),
    );
  }
}
