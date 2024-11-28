import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  const ScaleAnimationRoute({Key? key}) : super(key: key);

  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = Tween<double>(begin: 0.0, end: 800).animate(animation)
                  ..addListener(() {
                    setState(() {
                    });
                  });
    animation.addStatusListener((status) {// 状态监听
      /**
       * dismissed	动画在起始点停止
          forward	动画正在正向执行
          reverse	动画正在反向执行
          completed	动画在终点停止
       */
      if (status == AnimationStatus.completed) { // 完成
        //动画执行结束时反向执行动画
        // controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        // controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "images/radar_ic.png",
        height: animation.value,
        width: animation.value,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
