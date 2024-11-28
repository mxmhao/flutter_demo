import 'package:flutter/material.dart';

class DiscoverDetailPage extends StatelessWidget {
  const DiscoverDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("发现"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0.0, // 可以去掉iOS标题栏下方的阴影
      ),
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          child: Text("DiscoverDetailPage"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
