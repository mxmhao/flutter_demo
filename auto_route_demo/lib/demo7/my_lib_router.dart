import 'package:auto_route_demo/pages/posts.page.dart';

import '../pages/settings.page.dart';
import '../pages/users.page.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../pages/login.page.dart';

// 自动生成的文件
part 'my_lib_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class MyLibRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    // 嵌套路由
    AutoRoute(page: MyLibDashboardRoute.page, initial: true, children: [
      // 设置嵌套路由的首页，方式一：
      // AutoRoute(page: UsersRoute.page, path: ""),
      // 方式二
      // AutoRoute(page: UsersRoute.page, initial: true),
      // 方式三：用重定向Route，把 "" 定向到你首页
      RedirectRoute(path: "", redirectTo: "users"),
      AutoRoute(page: UsersRoute.page, path: "users"),
      // ==============================
      AutoRoute(page: PostsRoute.page),
      AutoRoute(page: SettingsRoute.page),
    ]),
    AutoRoute(page: LoginRoute.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}

@RoutePage()
class MyLibDashboardPage extends StatelessWidget {
  const MyLibDashboardPage({super.key});

  Widget _navLink(BuildContext context, String label, PageRouteInfo destination) {
    return ElevatedButton(onPressed: () {
      context.router.push(destination);
    }, child: Text(label, style: TextStyle(fontSize: 20),));
  }

  @override
  Widget build(BuildContext context) {
    // 这里的布局适合桌面端，不适合移动端
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Page2"),
      ),
      body: Row(
        children: [
          Column(
            children: [
              _navLink(context, 'Users', const UsersRoute()),
              _navLink(context, 'Posts', const PostsRoute()),
              _navLink(context, 'Settings', const SettingsRoute()),
            ],
          ),
          const Expanded(
            // 这个是必须的，是嵌套路由显示页面的地方
            child: AutoRouter(),
          ),
        ],
      ),
    );
  }
}