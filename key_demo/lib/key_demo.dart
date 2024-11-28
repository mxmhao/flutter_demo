import 'dart:math';

import 'package:flutter/material.dart';


class KeyDemo extends StatefulWidget {
  KeyDemo({super.key});

  @override
  State<StatefulWidget> createState() => _KeyDemoState();

}

class _KeyDemoState extends State<KeyDemo> {

  List<StfItem> list = [
    StfItem("111", key: UniqueKey(),),
    StfItem("222", key: UniqueKey()),
    StfItem("333", key: UniqueKey()),
    // 组件如果不设置 key，那他的状态就无法保持，setState 后就显示错误的状态。
    // 这里举例，运行项目，点击右下的按钮，注意以下组件的背景色，(提示：444的背景色会移到555上)
    // StfItem("444"),
    // StfItem("555"),
    // StfItem("666"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:Container(
        child: Row(
          children: list,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: const Icon(Icons.exposure_minus_1),
          onPressed: () {
            list.removeAt(0);
            setState(() {
          }
        );
      }),
    );
  }
}

class StlItem extends StatelessWidget {
  final String title;
  StlItem(this.title, {super.key});
  Color _color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: _color,
      child: Text(title),
    );
  }
}

class StfItem extends StatefulWidget {
  final String title;
  const StfItem(this.title, {super.key});

  @override
  State<StfItem> createState() => _StfItemState();
}

class _StfItemState extends State<StfItem> {

  Color _color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: _color,
      child: Center(child: Text(widget.title),),
    );
  }
}

