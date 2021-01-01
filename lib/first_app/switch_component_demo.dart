import 'package:flutter/material.dart';

class SwitchComponentDemo extends StatefulWidget {
  @override
  SwitchComponentDemoState createState() => SwitchComponentDemoState();
}

class SwitchComponentDemoState extends State<SwitchComponentDemo> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("单选开关和复选框示例页")),
        body: Column(
          children: [
            Switch(
              value: _switchSelected, //当前状态
              onChanged: (value) {
                //重新构建页面
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            )
          ],
        ));
  }
}
