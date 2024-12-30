import 'package:flutter/material.dart';

class Demo5 extends StatelessWidget {
  late final _title;

  Demo5({super.key}) {
    _title = runtimeType.toString();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Demo5TabBarView2(_title); //更换下面两个组件，效果是一样的
  }
}

class Demo5TabBarView1 extends StatefulWidget {
  final String _title;
  const Demo5TabBarView1(this._title, {super.key});

  @override
  State<Demo5TabBarView1> createState() => _Demo5TabBarView1State();
}

class _Demo5TabBarView1State extends State<Demo5TabBarView1> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget._title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget._title),
          bottom: TabBar(
            controller: _tabController, // 和下面的 TabBarView 使用同一个 controller 才会有联动效果
            tabs: tabs.map((e) => Tab(text: e,)).toList()),
        ),
        body: TabBarView(
          controller: _tabController, // 和上面的 TabBar 使用同一个 controller 才会有联动效果
          children: tabs.map((e) => Container(
            alignment: Alignment.center,
            child: Text(e),)
          ).toList()
        ),
      ),
    );
  }
}

class Demo5TabBarView2 extends StatelessWidget {
  Demo5TabBarView2(this._title, {super.key});
  final String _title;
  List tabs = ["新闻", "历史", "图片"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // TabBar 和 TabBarView 没有同一 controller，就套一层共同的父组件为 Controller，比如这里的：DefaultTabController
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(_title),
            bottom: TabBar(
                tabs: tabs.map((e) => Tab(text: e,)).toList()),
          ),
          body: TabBarView( // 和上面的 TabBar 使用同一个 controller 才会有联动效果
              children: tabs.map((e) => Container(
                alignment: Alignment.center,
                child: Text(e),)
              ).toList()
          ),
        )
      ),
    );
  }
}

