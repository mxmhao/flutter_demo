import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wechat_demo/pages/chat.dart';

import 'search_page.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with AutomaticKeepAliveClientMixin {

  bool _isCancel = false;
  List<Chat> _list = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("initState");

    var a = getDatas();
    a.then((List<Chat> list) {
      print(list);
      if (_isCancel) {
        return;
      }
      setState(() {
        _list = list;
      });
    }).catchError((e) {
      _isCancel = true;
      print(e);
    }).whenComplete(() {
      print("完成");
    }).timeout(const Duration(seconds: 1,))
    .catchError((timeout) {
      _isCancel = true;
      print("超时：${timeout}");
    });
  }

  Future<List<Chat>> getDatas() async {
    var response = await http.get(Uri.parse("http://rap2api.taobao.org/app/mock/320403/user"));
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      var resp = json.decode(response.body);
      return (resp["chat_list"] as List<dynamic>)
          .map<Chat>((item) { return Chat.fromJson(item);})
          .toList();
    } else {
      throw Exception("statusCode == ${response.statusCode}");
    }
  }

  Widget _buildPopupMenuItem(String img, String name) {
    return Row(
      children: [
        Image.asset(
          img,
          width: 25,
        ),
        SizedBox(width: 10,),
        Text(
          name,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("聊天"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          PopupMenuButton(
              child: Icon(
                Icons.add,
                size: 25,
              ),
              color: Color.fromRGBO(0, 0, 0, 0.5), // 弹出菜单的背景色
              offset: Offset(0, 40), // 弹出菜单的位移
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                        return SearchPage(_list);
                      }));
                    },
                    child:
                      _buildPopupMenuItem("images/radar_ic.png", "添加朋友1")),
                  PopupMenuItem(
                    child:
                      _buildPopupMenuItem("images/radar_ic.png", "添加朋友2")),
                  PopupMenuItem(
                    child: _buildPopupMenuItem("images/radar_ic.png", "添加朋友3"))
                ];
              })
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: _list.isEmpty ? const Center( child: Text("NO DATA"),) :
        ListView(
          children: _list.map<Widget>((Chat chat) {
            return ListTile(
              title: Text(chat.name!),
              subtitle: Container(
                child: Text(chat.msg!, overflow: TextOverflow.ellipsis,),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(chat.imageUrl!),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

/*
FutureBuilder(
            future: getDatas(),
            builder: (BuildContext context, AsyncSnapshot<List<Chat>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center( child: Text("loading"),);
              }
              if (!snapshot.hasData) {
                return const Center( child: Text("NO DATA"),);
              }
              return ListView(
                children: snapshot.data!.map<Widget>((Chat chat) {
                  return ListTile(
                    title: Text(chat.name!),
                    subtitle: Container(
                      child: Text(chat.msg!, overflow: TextOverflow.ellipsis,),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(chat.imageUrl!),
                    ),
                  );
                }).toList(),
              );
            })
 */
