import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputComponentDemo extends StatefulWidget {
  @override
  InputComponentDemoState createState() => InputComponentDemoState();
}

class InputComponentDemoState extends State<InputComponentDemo> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("输入框组件和表单示例页"),
        ),
        body: Center(
            child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: true,
                  controller: _userNameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "请输入用户名",
                      icon: Icon(Icons.person)),
                  // 校验用户名
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  }),
              TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "请输入登录密码",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  }),
              // 登录按钮
              RaisedButton(
                padding: EdgeInsets.all(15.0),
                child: Text("登录"),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  if ((_formKey.currentState as FormState).validate()) {
                    Fluttertoast.showToast(msg: "验证通过，用户名和密码符合规则");
                  }
                },
              ),
            ],
          ),
        )));
  }
}
