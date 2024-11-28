import 'package:flutter/material.dart';

// 在 test1 的基础上抽出了此类
// AnimatedWidget 自己添加了 addListener 和 setState
class AnimatedImage extends AnimatedWidget {

  late Animation<double> animation;

  AnimatedImage({super.key, required this.animation}) : super(listenable: animation);

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
}

class ScaleAnimationRoute2 extends StatefulWidget {
  const ScaleAnimationRoute2({Key? key}) : super(key: key);

  @override
  _ScaleAnimationRouteState2 createState() =>  _ScaleAnimationRouteState2();
}

class _ScaleAnimationRouteState2 extends State<ScaleAnimationRoute2>
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
    return AnimatedImage(
      animation: animation,
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
