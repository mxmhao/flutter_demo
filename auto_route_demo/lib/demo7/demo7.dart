import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'my_lib_router.dart';

// 演示从第三方库引入 router，适用于组件化开发、插件化开发等
class Demo7App extends StatelessWidget {
  const Demo7App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = Demo7Router();

    // 设置 router
    return MaterialApp.router(
      title: 'auto_route',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
    );
  }
}

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class Demo7Router extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.cupertino(); //.material, .cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    ...MyLibRouter().routes // 引入第三方库的routes。 '...'是dart语法
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}