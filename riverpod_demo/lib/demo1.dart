import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// flutter_riverpod 代码自动生成的标准写法，在本文件名和后缀之间加上'.g'
part 'demo1.g.dart'; // 必须引入，否则报错, flutter_riverpod 会自动生成此文件

/*
代码自动生成官方文档 https://dart.cn/tools/build_runner/
dart 上使用：
dart run build_runner build -d  自动生成代码。每次写了新代码都要运行一次
  -d 标志是可选的，与 --delete-conflicting-outputs 相同。
  正如命名所暗示的，它确保我们覆盖先前构建中的任何冲突输出（这通常是我们想要的）。
dart run build_runner clean 清理自动生成代码命令
dart run build_runner watch -d 监控项目，并实时自动生成代码

// 以下的几个命令会提示废弃： Deprecated. Use `dart run` instead. 所以直接用上面的就好
flutter 上使用：
flutter pub run build_runner build -d
flutter pub run build_runner clean
flutter pub run build_runner watch -d
*/

@riverpod // 自动生成代码，会生成一个 fetchTitleProvider 变量 在 demo1.g.dart 文件中
Future<String> fetchTitle(Ref ref) async {
  // 这里延迟 必须加上 await，前面老是没有显示加载圈就是这个原因，这是异步阻塞，不用sleep()，sleep是同步阻塞，不会显示加载圈
  await Future.delayed(const Duration(seconds: 5));
  return "Demo1";
}

@riverpod
String fetchTitle1(Ref ref) {
  return "Demo1";
}

// 如果不自动生成就要这么手写 Provider，Provider 用于访问不会改变的依赖项和对象。
final fetchTitleProvider2 = Provider<String>((ref) {
  return 'Hello world';
});

class Demo1 extends ConsumerWidget { // 使用 riverpod 提供的 ConsumerWidget 代替 StatelessWidget 简化代码
  // 使用 riverpod 提供的 ConsumerStatefulWidget 代替 StatefulWidget 简化代码
  const Demo1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2 通过 ref.watch 获取数据
    // 这两个是返回值有点不一样
    // fetchTitle 定义的是 Future<String> 做返回值
    final AsyncValue title = ref.watch(fetchTitleProvider);
    // 这两个定义的是 String 做返回值
    final String title1 = ref.watch(fetchTitle1Provider);
    final String title2 = ref.watch(fetchTitleProvider2);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo1"),
      ),
      body: Center(
        child: switch (title) { // title 通过状态变化来 返回视图
          AsyncData(:final value) => Text('Activity: ${value}'),
          AsyncError() => const Text('Oops, something unexpected happened'),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}
