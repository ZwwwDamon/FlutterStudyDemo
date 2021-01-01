import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonComponentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("按钮组件示例页")),
      body: Column(
        children: [
          RaisedButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "我是RaisedButton");
              },
              child: Text("RaisedButton")),
          FlatButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "我是OutlineButton");
              },
              child: Text("FlatButton")),
          OutlineButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "我是OutlineButton");
              },
              child: Text("OutlineButton")),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                Fluttertoast.showToast(msg: "我是IconButton");
              }),
          FlatButton.icon(
            onPressed: () {
              Fluttertoast.showToast(msg: "我是带图标的FlatButton");
            },
            icon: Icon(Icons.thumb_up),
            label: Text("点赞"),
          ),
          RaisedButton(
            onPressed: () {
              Fluttertoast.showToast(msg: "我是自定义了样式的RaisedButton");
            },
            color: Colors.green,
            child: Text("自定义了样式的RaisedButton"),
            textColor: Colors.white,
            highlightColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          )
        ],
      ),
    );
  }
}
