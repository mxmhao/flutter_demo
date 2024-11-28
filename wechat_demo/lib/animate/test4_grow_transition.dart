import 'package:flutter/material.dart';

// 进一步简化封装个第三方用。 SDK的FadeTransition、ScaleTransition、SizeTransition 也是类似的封装
class GrowTransition extends StatelessWidget {
  const GrowTransition({Key? key,
    required this.animation,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}