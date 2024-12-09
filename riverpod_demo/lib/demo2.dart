import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo2.g.dart'; // 必须引入，否则报错, flutter_riverpod 的生成器会生成此文件

/*
与 demo1 不同，此dome是在 “类” 上 添加@riverpod
demo1 的函数只能获取值，此dome可以在类中添加自己的方法，然后外部调用
 */

// https://riverpod.dev/docs/essentials/side_effects
@riverpod
class TodoList extends _$TodoList { // _$TodoList 会自动生成，是 flutter_riverpod 标准写法，生成后点进去看
  @override
  Future<List<Todo>> build() async {
    return [
      Todo(description: 'Learn Flutter', completed: true),
      Todo(description: 'Learn Riverpod'),
    ];
  }

  Future<void> addTodo(Todo todo) async {
    // 假设这里发起了请求
    // await http.post(
    //   Uri.https('your_api.com', '/todos'),
    //   // We serialize our Todo object and POST it to the server.
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(todo.toJson()),
    // );
    await Future.delayed(Duration(seconds: 3));
  }
}

class Todo {
  String description;
  bool? completed;
  Todo({required this.description, this.completed});
}

class Demo2 extends ConsumerWidget {
  const Demo2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        // 请注意，我们如何使用ref.read而不是ref.watch来调用我们的方法。
        // 虽然ref.watch技术上可以工作，但建议在“onPressed”等事件处理程序中执行逻辑时使用ref.read
        ref.read(todoListProvider.notifier).addTodo(Todo(description: 'This is a new todo'));
        print("onPressed");
      },
      child: const Text('Add todo'),
    );
  }
}