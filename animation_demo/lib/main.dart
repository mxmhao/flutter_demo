import 'package:animation_demo/test1_page_route_builder.dart';
import 'package:animation_demo/test2_icon_animated.dart';
import 'package:animation_demo/test4_implicit_animation.dart';
import 'package:animation_demo/test5_animated.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Test5Page(),
    );
  }
}
