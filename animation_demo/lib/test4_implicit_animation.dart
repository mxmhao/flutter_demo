import 'package:flutter/material.dart';

// 隐式动画：就是封装好的动画组件，隐藏了动画控制细节。flutter 提供了很多隐式动画组件
class Test4Page extends StatefulWidget {
  Test4Page({super.key});

  String title = "Test4Page";

  @override
  State<Test4Page> createState() => _Test4PageState();
}

class _Test4PageState extends State<Test4Page>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  bool flag = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _createAnimated6(), // 替换下面的_createAnimated方法，查看跟多演示
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // 必须放在 setState
            flag = !flag;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.start),
      ),
    );
  }

  Widget _createAnimated1() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: flag ? 100 : 200,
      height: flag ? 100 : 200,
      // Matrix4 是矩阵变换，这里做了个平移。更多可看 ：https://juejin.cn/post/7233589699214491709
      transform: flag
          ? Matrix4.translationValues(0, 0, 0)
          : Matrix4.translationValues(100, 0, 0),
      color: Colors.blue,
    );
  }

  Widget _createAnimated2() {
    return AnimatedPadding(
      duration: Duration(seconds: 1),
      curve: Curves
          .bounceInOut, // 动画执行曲线， easeInOut表示慢进慢出， bounceInOut 有点弹簧效果。也可以自定义
      padding: EdgeInsets.fromLTRB(10, flag ? 10 : 500, 0, 0),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    );
  }

  Widget _createAnimated3() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceInOut,
          // 平移
          left: flag ? 300 : 10,
          top: flag ? 300 : 10,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        )
      ],
    );
  }

  Widget _createAnimated4() {
    return Center(
      // TextStyle 动画
      child: AnimatedDefaultTextStyle(
        duration: const Duration(seconds: 1),
        curve: Curves.linear,
        style: TextStyle(
          fontSize: flag ? 50 : 20,
          color: Colors.red
        ),
        child: Text("你好"),
      )
    );
  }

  Widget _createAnimated5() {
    return Center(
      // 组件切换动画，当子组件变化的时候触发动画，默认是淡入淡出动画
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        // 自定义动画
        transitionBuilder: (child, animation) {
          // 这里叠加了两层动画
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(opacity: animation, child: child,),
          );
        },
        // 两个组件切换
        child: flag ? Icon(Icons.ac_unit_sharp, color: Colors.red, size: 50,) : CircularProgressIndicator(),
      )
    );
  }

  Widget _createAnimated6() {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(opacity: animation, child: child,),
          );
        },
        // AnimatedSwitcher内一个组件内部变化，如果key没变，就不会触发动画。这里用了UniqueKey，每次都会变，就表示Icon组件新建了
        child: Icon(key: UniqueKey(), flag ? Icons.ac_unit_sharp : Icons.account_balance_outlined, color: Colors.red, size: 150,),
      )
    );
  }
}
