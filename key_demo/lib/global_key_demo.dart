import 'package:flutter/material.dart';

class GlobalKeyDemo extends StatefulWidget {
  const GlobalKeyDemo({super.key});

  @override
  State<GlobalKeyDemo> createState() => _GlobalKeyDemoState();
}

class _GlobalKeyDemoState extends State<GlobalKeyDemo> {

  GlobalKey<_MyStfState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:Row(
        children: [MyStf(key: globalKey)], // 注入key
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          // GlobalKey 可以拿到 _MyStfState 然后修改值
          globalKey.currentState?.text += 1;
        });
      }),
    );
  }
}

class MyStf extends StatefulWidget {
  const MyStf({super.key});

  @override
  State<MyStf> createState() => _MyStfState();
}

class _MyStfState extends State<MyStf> {

  int text = 1;

  @override
  Widget build(BuildContext context) {
    return Text('$text');
  }
}

