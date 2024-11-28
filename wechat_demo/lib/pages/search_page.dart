import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'chat.dart';

@RoutePage()
class SearchPage extends StatefulWidget {

  List<Chat>? list;
  SearchPage(this.list);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController? _controller;

  List<Chat> list = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 44,
            color: Colors.lightBlue,
            child: Row(
              children: [
                Container(
                  height: 34,
                  width: 300,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,// 这里设置颜色后，Container就不能设置颜色了，否则崩溃
                    borderRadius:BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search),
                      Expanded(flex: 1, child: TextField(
                        controller: _controller!,
                        onChanged: onChanged,
                        autofocus: true, // 自动聚焦
                        cursorColor: Colors.red, // 光标颜色
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                          border: InputBorder.none, // 下面的线，或者边框
                          hintText: "搜索"
                        ),
                      )),
                      const Icon(Icons.cancel)
                    ],
                  ),
                ),
                Text("取消")
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: widget.list!.length,
                itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.list![index].name!),
                subtitle: Container(
                  child: Text(widget.list![index].msg!, overflow: TextOverflow.ellipsis,),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(widget.list![index].imageUrl!),
                ),
              );
            }))
        ],
      ),
    );
  }

  onChanged(String value) {
    print('onChanged- $value');
  }
}
