import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

// 这个要提前写好，否则无法生成代码
part 'products.g.dart';

@riverpod
Future<List<String>> productList(ProductListRef ref) async {
  String url = "http://rap2api.taobao.org/app/mock/320403/stringlist";
  Response response = await Dio().get(url);

  List<String> list = [];

  return list;
}

class NetworkPage extends ConsumerWidget {
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
