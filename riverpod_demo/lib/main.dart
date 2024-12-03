import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/demo1.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class Page1 extends StatelessWidget {

  Widget _myBuild(BuildContext context, Widget pushWidget, String title) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => pushWidget));
        },
        child: Text(title)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _myBuild(context, Demo1(), "Demo1"),
        _myBuild(context, Demo1(), "Demo2"),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Demo"),
        ),
        backgroundColor: Colors.green,
        body: Center(
          // child: ElevatedButton(onPressed: () {
          //   // 顶层的 BuildContext 无法拿到 Navigator，必须还得套一层自定义的 Widget，如上面的 Page1，
          //   // 使用 Page1 中的 BuildContext 才能 Navigator.push
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => Demo1()));
          // }, child: Text("Demo1")),
          child: Page1(), // 为了使用 Navigator.push 才套的一层自定义 Widget
        ),
      ),
    );
  }
}