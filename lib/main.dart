import 'package:flutter/material.dart';
import 'package:flutterstudyapp/first_app/route_demo.dart';

import 'first_app/counter_demo.dart';
import 'first_app/package_manager_demo.dart';
import 'first_app/route_demo.dart';
import 'first_app/state_manager_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String ROUTE_NAME_HOME = "home_page";
  static const String ROUTE_NAME_COUNTER_DEMO = "counter_demo";
  static const String ROUTE_NAME_ROUTE_DEMO = "route_demo";
  static const String ROUTE_NAME_PACKAGE_MANAGER_DEMO = "package_manager_demo";
  static const String ROUTE_NAME_STATE_MANAGER_DEMO = "state_manager_demo";
  static const String ROUTE_NAME_NEW_ROUTE_PAGE = "new_route_page";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: ROUTE_NAME_HOME,
        title: "FlutterStudyDemo",
        routes: {
          ROUTE_NAME_HOME: (context) => HomeDemoPage(),
          ROUTE_NAME_COUNTER_DEMO: (context) => CounterDemoPage(),
          ROUTE_NAME_ROUTE_DEMO: (context) => RouteDemoPage(),
          ROUTE_NAME_PACKAGE_MANAGER_DEMO: (context) => PackageDemoPage(),
          ROUTE_NAME_STATE_MANAGER_DEMO: (context) => StateManagerDemoPage()
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
//      case ROUTE_NAME_COUNTER_DEMO:
//        return CounterDemoPage();
//      case ROUTE_NAME_ROUTE_DEMO:
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
                  Navigator.pushNamed(context, MyApp.ROUTE_NAME_COUNTER_DEMO,
                      arguments: "计数器示例页");
                },
                child: Text("打开计数器示例页")),
            FlatButton(
              onPressed: () {
                //通过命名路由打开新路由
                Navigator.pushNamed(context, MyApp.ROUTE_NAME_ROUTE_DEMO);
              },
              child: Text("打开路由示例页"),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyApp.ROUTE_NAME_PACKAGE_MANAGER_DEMO);
                },
                child: Text("打开包管理示例")),
            FlatButton(onPressed: () {
              Navigator.pushNamed(context, MyApp.ROUTE_NAME_STATE_MANAGER_DEMO);
            }, child: Text("打开状态管理示例页"))
          ],
        ),
      ),
    );
  }
}
