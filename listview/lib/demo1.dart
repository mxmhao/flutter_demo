import 'package:flutter/material.dart';

class Demo1 extends StatelessWidget {
  late final _title;

  Demo1({super.key}) {
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
        body: ListViewDemo(), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    // 监听
    _controller.addListener(() {
      // 当 _controller 一对多时，_controller.offset 会直接报错
      // print(_controller.offset);
      print(_controller.positions.first.pixels);
      print(_controller.positions.last.pixels);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          // 当一个页面中包含多个可滚动组件时，如果你发现在进行一些跳转或切换操作后，滚动位置不能正确恢复，这时你可以通过显式指定PageStorageKey来分别跟踪不同的可滚动组件的位置
          // key: PageStorageKey(1), // key要根据类型和场景使用，这里的滚动场景适合用PageStorageKey
          child: ListView.builder(
            controller: _controller,
            // 具体高度，具体高度和下面的抽象高度互斥
            itemExtent: 30,
            // 指定一个抽象高度，当不知道具体高度时，可以直接指定 itemBuilder 的返回组件当做抽象高度
            // prototypeItem: ListTile(title: Text("data:"),),
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("data: $index"),);
            }
        )
        ),
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return MyPage();
          }));
        }, child: Text("push")),
        ElevatedButton(onPressed: () {
          _controller.positions.first.jumpTo(300);
          _controller.positions.last.jumpTo(200);
        }, child: Text("jump")),
        Expanded(
          flex: 1,
          // 当一个页面中包含多个可滚动组件时，如果你发现在进行一些跳转或切换操作后，滚动位置不能正确恢复，这时你可以通过显式指定PageStorageKey来分别跟踪不同的可滚动组件的位置
          key: PageStorageKey(2),
          child: ListView.builder(
            controller: _controller,
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return Text("data: $index");
            }
          )
        )
      ],
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("MyPage"),
      ),
      body: Text("MyPage")
    );
  }
}
