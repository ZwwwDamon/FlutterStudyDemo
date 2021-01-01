import 'package:flutter/material.dart';
import 'package:flutterstudyapp/first_app/input_component_demo.dart';
import 'package:flutterstudyapp/first_app/route_demo.dart';
import 'package:flutterstudyapp/first_app/text_component_demo.dart';

import 'first_app/button_component_demo.dart';
import 'first_app/counter_demo.dart';
import 'first_app/image_component_demo.dart';
import 'first_app/package_manager_demo.dart';
import 'first_app/progress_component_demo.dart';
import 'first_app/route_demo.dart';
import 'first_app/state_manager_demo.dart';
import 'first_app/switch_component_demo.dart';

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
  static const String ROUTE_NAME_TEXT_COMPONENT_DEMO = "text_component_demo";
  static const String ROUTE_NAME_BUTTON_COMPONENT_DEMO = "button_component_demo";
  static const String ROUTE_NAME_IMAGE_COMPONENT_DEMO = "image_component_demo";
  static const String ROUTE_NAME_SWITCH_COMPONENT_DEMO = "switch_component_demo";
  static const String ROUTE_NAME_INPUT_COMPONENT_DEMO = "input_component_demo";
  static const String ROUTE_NAME_PROGRESS_COMPONENT_DEMO = "progress_component_demo";
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
          ROUTE_NAME_STATE_MANAGER_DEMO: (context) => StateManagerDemoPage(),
          ROUTE_NAME_TEXT_COMPONENT_DEMO: (context) => TextComponentDemo(),
          ROUTE_NAME_BUTTON_COMPONENT_DEMO: (context) => ButtonComponentDemo(),
          ROUTE_NAME_IMAGE_COMPONENT_DEMO: (context) => ImageComponentDemo(),
          ROUTE_NAME_SWITCH_COMPONENT_DEMO: (context) => SwitchComponentDemo(),
          ROUTE_NAME_INPUT_COMPONENT_DEMO: (context) => InputComponentDemo(),
          ROUTE_NAME_PROGRESS_COMPONENT_DEMO: (context) => ProgressComponentDemo()
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
            RaisedButton(
                onPressed: () {
                  //通过命名路由打开新路由并传参
                  Navigator.pushNamed(context, MyApp.ROUTE_NAME_COUNTER_DEMO,
                      arguments: "计数器示例页");
                },
                child: Text("打开计数器示例页")),
            RaisedButton(
              onPressed: () {
                //通过命名路由打开新路由
                Navigator.pushNamed(context, MyApp.ROUTE_NAME_ROUTE_DEMO);
              },
              child: Text("打开路由示例页"),
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyApp.ROUTE_NAME_PACKAGE_MANAGER_DEMO);
                },
                child: Text("打开包管理示例")),
            RaisedButton(onPressed: () {
              Navigator.pushNamed(context, MyApp.ROUTE_NAME_STATE_MANAGER_DEMO);
            }, child: Text("打开状态管理示例页")),
            RaisedButton(onPressed: (){
              Navigator.pushNamed(context, MyApp.ROUTE_NAME_TEXT_COMPONENT_DEMO);
            }, child: Text("打开文本组件示例页")),
            RaisedButton(onPressed: (){
              Navigator.pushNamed(context, MyApp.ROUTE_NAME_BUTTON_COMPONENT_DEMO);
            }, child: Text("打开按钮组件示例页")),
            RaisedButton(onPressed: (){
              Navigator.pushNamed(context, MyApp.ROUTE_NAME_IMAGE_COMPONENT_DEMO);
            }, child: Text("打开图片组件示例页")),
            RaisedButton(onPressed: (){
              Navigator.pushNamed(context, MyApp.ROUTE_NAME_SWITCH_COMPONENT_DEMO);
            }, child: Text("打开单选开关和复选框组件示例页")),
            RaisedButton(onPressed: (){
              Navigator.pushNamed(context, MyApp.ROUTE_NAME_INPUT_COMPONENT_DEMO);
            }, child: Text("打开输入框组件和表单示例页")),
            RaisedButton(onPressed: (){
              Navigator.pushNamed(context, MyApp.ROUTE_NAME_PROGRESS_COMPONENT_DEMO);
            }, child: Text("打开进度条示例页"))
          ],
        ),
      ),
    );
  }
}
