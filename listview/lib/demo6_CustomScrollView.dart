import 'package:flutter/material.dart';

class Demo6 extends StatelessWidget {
  late final _title;

  Demo6({super.key}) {
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
        body: CustomScrollViewDemo1(), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class CustomScrollViewDemo1 extends StatefulWidget {
  const CustomScrollViewDemo1({super.key});

  @override
  State<CustomScrollViewDemo1> createState() => _CustomScrollViewDemo1State();
}

class _CustomScrollViewDemo1State extends State<CustomScrollViewDemo1> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var list = SliverFixedExtentList(
      itemExtent: 56, // 固定高度
      delegate: SliverChildBuilderDelegate(
        (_, index) => ListTile(title: Text("$index"),),
        childCount: 10,
      ),
    );

    return CustomScrollView(
        slivers: [
          list,
          list
        ]
    );
  }
}
