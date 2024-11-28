import 'package:flutter/material.dart';

// 图标变形动画，
class Test2Page extends StatefulWidget {
  Test2Page({super.key});

  String title = "Test2Page";

  @override
  State<Test2Page> createState() => _Test2PageState();
}

class _Test2PageState extends State<Test2Page>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  bool flag = true;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // AnimatedIcons.home_menu 表示 从 home 到 menu 的动画。flutter提供了几个动画
        child: AnimatedIcon(
            icon: AnimatedIcons.home_menu,
            color: Colors.blue,
            size: 100.0,
            progress: controller),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          flag ? controller.forward() : controller.reverse();
          flag = !flag;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.start),
      ),
    );
  }
}
