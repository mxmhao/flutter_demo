import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

/*
代码自动生成官方文档 https://dart.cn/tools/build_runner/
dart 上使用：
dart run build_runner build -d  自动生成代码，每次写了新代码，都要运行一次
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

// 这个要提前写好，否则无法生成代码
part 'products.g.dart';

@riverpod
Future<List<String>> productList(ProductListRef ref) async {
  String url = "http://rap2api.taobao.org/app/mock/320403/stringlist";
  Response response = await Dio().get(url);

  List<String> list = [];

  return list;
}

class NetworkPage extends ConsumerWidget { // 使用 riverpod 提供的 ConsumerWidget 简化代码
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2 通过 ref.watch 获取数据
    final AsyncValue<List<String>> products =
    ref.watch(productListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('拉取数据'),
      ),
      body: Center(
        child: switch(products) {
          AsyncData<List<String>>(:final value) => ListView.builder(
            itemCount: value.length,
              itemBuilder: (BuildContext context, int index) {
                Text(value[index]);
              }),
          AsyncError() => Text("2"),
          _ => Text("3"),
        },
      ),
    );
  }
}
