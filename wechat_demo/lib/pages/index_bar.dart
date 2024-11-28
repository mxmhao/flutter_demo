import 'package:flutter/material.dart';

class IndexBar extends StatefulWidget {
  const IndexBar({super.key});

  @override
  State<IndexBar> createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {

  Color bgColor = Color.fromRGBO(0, 0, 0, 0);
  Color fontColor = Colors.black;

  final List<String> _list = ['☆', '🔍︎', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
    'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < _list.length; ++i) {
      list.add(Expanded(child: Text(_list[i], style: TextStyle(fontSize: 10, color: fontColor),)));
    }

    return GestureDetector(
      onVerticalDragDown: (DragDownDetails details) {
        setState(() {
          bgColor = Color.fromRGBO(0, 0, 0, 0.3);
          fontColor = Colors.white;
        });
      },
      onVerticalDragEnd: (DragEndDetails details) {
        setState(() {
          bgColor = Color.fromRGBO(0, 0, 0, 0);
          fontColor = Colors.black;
        });
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
        print("${details.localPosition}");
        print("${details.globalPosition}");
        print("当前 Widget 的高度: ${context.findRenderObject()?.paintBounds.height}");
        double itemHeight = context.findRenderObject()!.paintBounds.height / _list.length;
        print("item 的高度: ${itemHeight}");
        int select = (details.localPosition.dy ~/ itemHeight).clamp(0, _list.length - 1);
        print("选到第 ${select} -- ${_list[select]}");
      },
      child: Container(
        color: bgColor ,
        child: Column(
          children: list,
        ),
      ),
    );
  }
}
