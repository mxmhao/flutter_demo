import 'package:flutter/material.dart';

// 图标变形动画，
class Test5Page extends StatefulWidget {
  Test5Page({super.key});

  String title = "Test5Page";

  @override
  State<Test5Page> createState() => _Test5PageState();
}

class _Test5PageState extends State<Test5Page>
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
        child: RotationTransition(
          turns: controller,
          child: Container(
            width: 150,
            height: 150,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 用 AnimationController 就不需要 setState
          flag ? controller.forward() : controller.reverse();
          flag = !flag;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.start),
      ),
    );
  }
}
