import 'package:flutter/material.dart';

class TextComponentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("文本组件示例"),
      ),
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.black, fontSize: 18.0),
        textAlign: TextAlign.start,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              child: Text("我是文字居中对齐",
                  textAlign: TextAlign.center, style: TextStyle()),
              width: double.infinity),
          Container(
            child:
                Text("我是文字右对齐", textAlign: TextAlign.right, style: TextStyle()),
            width: double.infinity,
          ),
          Text("我最多只能展示一行，剩下的用...展示" * 4,
              maxLines: 1, overflow: TextOverflow.ellipsis),
          Container(
            child: Text("我能对字体缩放2倍", textScaleFactor: 2.0),
            width: double.infinity,
          ),
          Text("我是一段有个性的文字,和它们不一样",
              style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.blue,
                  fontFamily: "Courier",
                  backgroundColor: Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid)),
          Text.rich(TextSpan(children: [
            TextSpan(text: "这是我分段展示的内容："),
            TextSpan(text: "我是蓝色字", style: TextStyle(color: Colors.blue)),
            TextSpan(
                text: "我是黄色字且我比较大",
                style: TextStyle(color: Colors.yellow, fontSize: 28.0))
          ])),
        ]),
      ),
    );
  }
}
