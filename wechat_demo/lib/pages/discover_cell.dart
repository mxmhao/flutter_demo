import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover_detail_page.dart';

class DiscoverCell extends StatefulWidget {
  String title;
  String? subtitle;
  String imageName;
  String? subImageName;

  DiscoverCell({required this.title, required this.imageName, this.subtitle, this.subImageName});

  @override
  State<StatefulWidget> createState() => _DiscoverCellState();


}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _crrentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tap : $widget.title");
        setState(() {
          _crrentColor = Colors.white;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return DiscoverDetailPage();
          }),
        );
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _crrentColor = Colors.grey;
        });
      },
      onTapCancel: () {
        setState(() {
          _crrentColor = Colors.white;
        });
      },
      child: Container(
        color: _crrentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(widget.imageName, width: 30,),
                  const SizedBox(width: 15,),
                  Text(widget.title)
                ],
              ),
            ),
            Container(),
            Container(
              child: Row(
                children: [
                  Text( widget.subtitle ??  ""),
                  null != widget.subImageName? Image.asset(widget.subImageName!): Container(),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
