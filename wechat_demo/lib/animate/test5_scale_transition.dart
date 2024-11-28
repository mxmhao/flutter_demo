import 'package:flutter/material.dart';

// 使用ScaleTransition
class Test4ScaleTransition extends StatefulWidget {
  const Test4ScaleTransition({super.key});

  @override
  State<Test4ScaleTransition> createState() => _Test4ScaleTransitionState();
}

class _Test4ScaleTransitionState extends State<Test4ScaleTransition> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =  AnimationController(duration: const Duration(seconds: 5), vsync: this);
    //图片宽高从0变到300
    animation =  Tween(begin: 0.0, end: 3.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ScaleTransition(
            scale: animation,
            child: Image.asset("images/radar_ic.png",)
        )
    );
  }
}
