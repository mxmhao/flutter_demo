import 'package:flutter/material.dart';


class ScaleAnimationRoute3 extends StatefulWidget {
  const ScaleAnimationRoute3({Key? key}) : super(key: key);

  @override
  _ScaleAnimationRouteState3 createState() =>  _ScaleAnimationRouteState3();
}

class _ScaleAnimationRouteState3 extends State<ScaleAnimationRoute3>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller =  AnimationController(
        duration: const Duration(seconds: 5), vsync: this);
    //图片宽高从0变到300
    animation =  Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // 在test2的基础上进一步简化
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset("images/radar_ic.png",),
      builder: (BuildContext context, Widget? child) {
        return Center(
          child: SizedBox( // 无法直接设置 child 的宽高，那就通过 SizedBox去设置把
            height: animation.value,
            width: animation.value,
            child: child,
          ),
        );
      },
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
