import 'package:flutter/material.dart';

class RouteDemoPage extends StatefulWidget {
  @override
  State<RouteDemoPage> createState() => RouteDemoPageState();
}

class RouteDemoPageState extends State<RouteDemoPage> {
  String argument = "this is agruments";
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("RouteDemoPage"),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(
            child: Text("打开新路由并传参：$argument"),
            onPressed: () async {
              //这里不用命名路由的方式来打开
              result = await Navigator.pushNamed(context, "new_route_page",
                  arguments: argument);
              setState(() {});
            },
          ),
          Text("接收上个页面关闭时传递的参数：${result ?? null}")
        ])));
  }
}

class NewRoutePage extends StatelessWidget {
  final String returnStr = "上个页面已关闭";
  final String argument;

  NewRoutePage({Key key, this.argument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("arguments = $argument");
    return Scaffold(
      appBar: AppBar(title: Text("接收参数的路由")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("传入的参数是：$argument"),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop(returnStr);
                },
                child: Text("关闭此页面，带回去参数：$returnStr"))
          ],
        ),
      ),
    );
  }
}

class BlockRoutePage extends StatelessWidget {
  static var isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("路由生成钩子示例")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("假设这是个登录页，点击下面的登录按钮才能进入接收参数的路由页面"),
            RaisedButton(
                onPressed: () {
                  //伪代码
                  isLogin = true;
                  Navigator.pop(context);
                },
                child: Text("点击登录"))
          ],
        )));
  }
}
