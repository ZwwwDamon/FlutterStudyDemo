import 'package:flutter/material.dart';
import 'package:flutterstudyapp/first_app/route_demo.dart';

import 'first_app/counter_demo.dart';
import 'first_app/counter_demo.dart';
import 'first_app/route_demo.dart';
import 'first_app/route_demo.dart';
import 'first_app/route_demo.dart';
import 'first_app/route_demo.dart';
import 'first_app/route_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "home_page",
        title: "FlutterStudyDemo",
        routes: {
          "home_page": (context) => HomeDemoPage(),
          "counter_demo": (context) => CounterDemoPage(),
          "route_demo": (context) => RouteDemoPage()
        },
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            String routeName = settings.name;
            var arguments = settings.arguments;
            print("拦截该路由-->$routeName,参数为：$arguments");
            if (BlockRoutePage.isLogin) {
              //跳转到对应的路由页面
              return _getRoutePage(settings);
            } else {
              //跳转到拦截的登录页
              return BlockRoutePage();
            }
          });
        },
        theme: ThemeData(primarySwatch: Colors.blue));
  }

  Widget _getRoutePage(RouteSettings routeSettings) {
    var routeName = routeSettings.name;
    String arguments = routeSettings.arguments;
    switch (routeName) {
//      case "counter_demo":
//        return CounterDemoPage();
//      case "route_demo":
//        return RouteDemoPage();
      case "new_route_page":
        return NewRoutePage(argument: arguments);
      default:
        return HomeDemoPage();
    }
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
                  //通过命名路由打开新路由并传参
                  Navigator.pushNamed(context, "counter_demo",
                      arguments: "计数器示例页");
                },
                child: Text("打开计数器示例页")),
            FlatButton(
              onPressed: () {
                //通过命名路由打开新路由
                Navigator.pushNamed(context, "route_demo");
              },
              child: Text("打开路由示例页"),
            )
          ],
        ),
      ),
    );
  }
}
