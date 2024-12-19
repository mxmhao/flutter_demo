import 'package:flutter/material.dart';

class Demo2 extends StatelessWidget {
  late final _title;

  Demo2({super.key}) {
    _title = runtimeType.toString();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(_title),
        ),
        body: ListViewDemo2(), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class ListViewDemo2 extends StatefulWidget {
  const ListViewDemo2({super.key});

  @override
  State<ListViewDemo2> createState() => _ListViewDemo2State();
}

class _ListViewDemo2State extends State<ListViewDemo2> {

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    // 监听
    _controller.addListener(() {
      print(_controller.offset);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar( // 滚动条套在ListView的外面
      controller: _controller, // _controller 放在 Scrollbar 中
      child: ListView.builder( // ListView 自己是没有滚动条的
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Text("data: $index");
          }
      )
    );
  }
}
