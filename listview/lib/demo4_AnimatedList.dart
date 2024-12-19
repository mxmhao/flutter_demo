import 'package:flutter/material.dart';

class Demo4 extends StatelessWidget {
  late final _title;

  Demo4({super.key}) {
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
  final globalKey = GlobalKey<AnimatedListState>();

  var data = <String>[];
  int counter = 5;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 5; ++i) {
      data.add("${i + 1}");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedList(
          key: globalKey,
          initialItemCount: data.length,
          itemBuilder: (BuildContext context, int index, Animation<double> animation) {
            // 添加列表项时会执行渐显动画
            return FadeTransition(
              opacity: animation,
              child: buildItem(context, index),
            );
          },
        ),
        buildAddBtn(),
      ],
    );
  }

  // 构建列表项
  Widget buildItem(BuildContext context, int index) {
    String char = data[index];
    return ListTile(
      //数字不会重复，所以作为Key
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        // 点击时删除
        onPressed: () => onDelete(context, index),
      ),
    );
  }

  // 创建一个 “+” 按钮，点击后会向列表中插入一项
  Widget buildAddBtn() {
    return Positioned(
      bottom: 30,
      left: 10,
      right: 10,
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // 添加一个列表项
          data.add('${++counter}');
          // 告诉列表项有新添加的列表项
          globalKey.currentState?.insertItem(data.length - 1);
          print('添加 $counter');
        },
      ),
    );
  }

  void onDelete(BuildContext context, int index) {
    setState(() {
      globalKey.currentState?.removeItem(index, (context, animation) {
        var item = buildItem(context, index);
        print('删除 ${data[index]}');
        // 先删数据
        data.removeAt(index);
        // 删除动画是一个合成动画：渐隐 + 收缩列表项
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            // 让透明度变化的更快一些
            curve: const Interval(0.5, 1.0),
          ),
          // 不断缩小列表项的高度
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0.0,
            child: item,
          ),
        );
      },
        duration: Duration(seconds: 5) // 动画时长
      );
    });
  }
}
