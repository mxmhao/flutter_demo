import 'package:flutter/material.dart';

// 交织动画
class Test3Page extends StatefulWidget {
  Test3Page({super.key});

  String title = "Test2Page";

  @override
  State<Test3Page> createState() => _Test3PageState();
}

class _Test3PageState extends State<Test3Page>
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
        // AnimatedIcons.home_menu 表示 从 home 到 menu 的动画
        child: Container()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          flag? controller.forward() : controller.reverse();
          flag = !flag;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.start),
      ),
    );
  }
}
