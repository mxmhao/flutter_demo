import 'package:flutter/material.dart';

class Demo3 extends StatelessWidget {
  late final _title;

  Demo3({super.key}) {
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
        body: ListViewDemo3(), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class ListViewDemo3 extends StatefulWidget {
  const ListViewDemo3({super.key});

  @override
  State<ListViewDemo3> createState() => _ListViewDemo3State();
}

class _ListViewDemo3State extends State<ListViewDemo3> {

  String _progress = '0%';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 可滚动组件在滚动时会发送ScrollNotification类型的通知，ScrollBar正是通过监听滚动通知来实现的。通过NotificationListener监听滚动事件和通过ScrollController有两个主要的不同：
    // NotificationListener可以在可滚动组件到widget树根之间任意位置监听。而ScrollController只能和具体的可滚动组件关联后才可以。
    // 收到滚动事件后获得的信息不同；NotificationListener在收到滚动事件时，通知中会携带当前滚动位置和ViewPort的一些信息，而ScrollController只能获取当前滚动位置
    return Scrollbar( // 滚动条套在ListView的外面
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
          _progress = "${(progress * 100).toInt()}%";
          setState(() {
          });
          return false;
          //return true; // 放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView.builder( // ListView 自己是没有滚动条的
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Text("data: $index");
                }
            ),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        )
      )
    );
  }
}
