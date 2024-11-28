import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MyData(count, child: Column(
      children: [
        Text1(count),
        ElevatedButton(onPressed: () {
          count++;
          setState(() {
          });
        }, child: Text('add'))
      ],
    ));
  }
}

class Text1 extends StatelessWidget {
  final int data;
  Text1(this.data);

  @override
  Widget build(BuildContext context) {
    return Text2(data);
  }

}

class Text2 extends StatelessWidget {
  final int data;
  Text2(this.data);

  @override
  Widget build(BuildContext context) {
    return Text3(data);
  }

}

class Text3 extends StatefulWidget {
  final int data;
  Text3(this.data);

  @override
  State<StatefulWidget> createState() {
    return _Text3State();
  }


}

class _Text3State extends State<Text3> {

  @override
  void activate() {
    super.activate();
    print('来了 activate');
  }

  @override
  void initState() {
    super.initState();
    print('来了 initState');
  }

  @override
  Widget build(BuildContext context) {
    print('来了 build');
    return Text('${MyData.of(context)!.data}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('来了 didChangeDependencies');
  }

  @override
  void dispose() {
    super.dispose();
    print('来了 dispose');
  }
}

// 用于数据共享，他的子组件，子组件的子组件等等···都能通过 of方法 获取到共享的数据
class MyData extends InheritedWidget {
  final int data;
  MyData(this.data, {super.key,  required super.child});

  @override
  bool updateShouldNotify(covariant MyData oldWidget) {
    return oldWidget.data != data;
  }

  static MyData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyData>();
  }
}
