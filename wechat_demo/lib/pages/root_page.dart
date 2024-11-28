import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat_page.dart';
import 'package:wechat_demo/pages/discover_page.dart';
import 'package:wechat_demo/pages/friends_page.dart';
import 'package:wechat_demo/pages/me_page.dart';

@RoutePage()
class RootPage extends StatefulWidget {

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  int _current = 0;
  final List<Widget> _list = [ChatPage(), FriendsPage(), DiscoverPage(), MePage()];
  final PageController _controller = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12, // 默认大小
        selectedItemColor: Colors.red,
        currentIndex: _current,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "微信"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "联系人"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "发现"),
          BottomNavigationBarItem(icon: Icon(Icons.near_me), label: "我的"),
        ],
        onTap: (int index) {
          _current = index;
          setState(() {
            _controller.jumpToPage(index);
          });
        },
      ),
      body: PageView(
        controller: _controller,
        children: _list,
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
        onPageChanged: (index) { // 若是允许滑动，这里是切换页面的回调
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }
}
