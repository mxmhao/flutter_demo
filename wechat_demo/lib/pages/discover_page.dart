import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;
  
  @override
  void initState() {
    super.initState();
    print("_DiscoverPageState: initState");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("发现"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0.0, // 可以去掉iOS标题栏下方的阴影
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            DiscoverCell(title: "扫一扫", imageName: "images/radar_ic.png")
          ],
        ),
      ),
    );
  }
}
