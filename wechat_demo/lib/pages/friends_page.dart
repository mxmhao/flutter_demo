import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/index_bar.dart';
import 'package:http/http.dart' as http;

class Friend {
  String? name;
  String? msg;
  String? imageUrl;

  Friend({required this.name, required this.msg, this.imageUrl});

  factory Friend.fromMap(Map<String, String> map) {
    return Friend(name: map["name"], msg: map["msg"], imageUrl: map["imageUrl"]);
  }

}

class FriendsPage extends StatefulWidget {
  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> with AutomaticKeepAliveClientMixin {
  double _top = 0;
  double _h = 0;
  ScrollController? _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("_FriendsPageState: initState");

    int i = 0;
    i.clamp(-1, 20);

    _controller = ScrollController();
    
    getDatas();
  }

  getDatas() async {
    var response = await http.get(Uri.parse("http://rap2api.taobao.org/app/mock/320403/user"));
    print(response.statusCode);
    print(response.body);

    // Map<String, String> map = jsonDecode(response.body);
    // Friend.fromMap(map);

    // _controller.animateTo(offset, duration: duration, curve: curve)
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _top = MediaQuery.of(context).size.height/8;
    _h = MediaQuery.of(context).size.height/2;
    return Scaffold(
      appBar: AppBar(
        title: const Text("联系人"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        child: Stack(
          children: [
            // Container(
            //   child: ListView.builder(
            //     controller: _controller,
            //     itemBuilder: (BuildContext context, int index) {}
            //   ),
            // ), // 这个用来把整个stack撑大
            Positioned(right: 0, top: _top, bottom: _top, width: 30, child: const IndexBar())
          ],
        ),
      ),
    );
  }
}
