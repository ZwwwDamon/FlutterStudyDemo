import 'package:flutter/material.dart';

class ProgressComponentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("进度条组件示例页")),
      body: Column(
        children: [
          Text("模糊线性进度条,适用于没有具体进度的业务场景"),
          LinearProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          Text("精确线性进度条，适用于知晓进度的业务场景"),
          LinearProgressIndicator(
            backgroundColor: Colors.grey,
            value: .6,
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
          Text("模糊圆形进度条,适用于没有具体进度的业务场景"),
          CircularProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation(Colors.yellow),
            strokeWidth: 6.0,
          ),
          Text("指定大小精确圆形进度条，适用于知晓进度的业务场景"),
          SizedBox(
              height: 150,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.red),
                value: .4,
              ))
        ],
      ),
    );
  }
}
