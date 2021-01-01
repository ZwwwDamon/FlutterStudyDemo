import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageComponentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("images/cat.jpg");
    return Scaffold(
        appBar: AppBar(title: Text("图片组件示例")),
        body: SingleChildScrollView(
          child: Column(children: [
            Text("从asset中加载图片"),
            Image.asset("images/cat.jpg", width: 150),
            Text("从网络加载图片"),
            Image.network("https://www.baidu.com/img/bdlogo.png", width: 150),
            Text("BoxFit.fill"),
            Image(image: img, height: 100, width: 200, fit: BoxFit.fill),
            Text("BoxFit.contain"),
            Image(image: img, height: 200, width: 200, fit: BoxFit.contain),
            Text("BoxFit.cover"),
            Image(image: img, height: 200, width: 200, fit: BoxFit.cover),
            Text("BoxFit.fitWidth"),
            Image(image: img, height: 100, width: 200, fit: BoxFit.fitWidth),
            Text("BoxFit.fitHeight"),
            Image(image: img, height: 200, width: 100, fit: BoxFit.fitHeight),
            Text("BoxFit.none"),
            Image(image: img, height: 200, width: 200, fit: BoxFit.none),
            Text("repeat重复"),
            Image(
                image: img,
                height: 200,
                width: double.infinity,
                repeat: ImageRepeat.repeatX),
            Text("混色"),
            Image(
              image: img,
              width: 200,
              color: Colors.yellow,
              colorBlendMode: BlendMode.difference
            )
          ]),
        ));
  }
}
