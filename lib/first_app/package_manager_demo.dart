import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PackageDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //生成随机字符串
    var wordPair = new WordPair.random();
    print("生成的随机字符串：$wordPair");

    return Scaffold(
        appBar: AppBar(title: Text("包管理示例页")),
        body:
            Center(child: Text("这里展示引入english_words包，利用其生成的随机字符串：$wordPair")));
  }
}
