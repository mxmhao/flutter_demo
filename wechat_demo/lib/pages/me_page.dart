import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {

  @override
  void initState() {
    super.initState();
    print("_MePageState: initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: MediaQuery.removePadding( // 删除Padding
            context: context,
            removeTop: true,
            child: ListView(
              children: [
                Container(
                  height: 200,
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        // 用装饰裁剪4个角落
                        decoration: BoxDecoration(
                            color: Colors.red, // 底色
                            borderRadius: BorderRadius.circular(12),
                            // 填充要被裁剪的图片
                            image: const DecorationImage(image: AssetImage("images/radar_ic.png"))
                        )
                      )
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
