import 'package:auto_route_demo/pages/posts.page.dart';

import '../pages/settings.page.dart';
import '../pages/users.page.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../pages/login.page.dart';

// 自动生成的文件
part 'demo6.gr.dart';

// 演示 GlobalKey 获取路由，和通过名称获取路由
class Demo6App extends StatelessWidget {
  const Demo6App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = Demo6Router();

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
class Demo6Router extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.cupertino(); //.material, .cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    // 嵌套路由
    AutoRoute(page: Demo6DashboardRoute.page, initial: true, children: [
      AutoRoute(page: UsersRoute.page, initial: true),
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
class Demo6DashboardPage extends StatefulWidget {
  const Demo6DashboardPage({super.key});

  @override
  State<Demo6DashboardPage> createState() => _Demo6DashboardPageState();
}

class _Demo6DashboardPageState extends State<Demo6DashboardPage> {
  //
  final _innerRouterKey = GlobalKey<AutoRouterState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Page2"),
      ),
      body: Row(
        children: [
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // 通过 GlobalKey 获取 router 然后 push
                  final router = _innerRouterKey.currentState?.controller;
                  router?.push(const UsersRoute());

                  // 通过名称获取路由，泛型表示返回值类型。
                  context.innerRouterOf<StackRouter>(UsersRoute.name);
                  context.innerRouterOf<TabsRouter>(UsersRoute.name);

                  // 或者通过 provider 等第三方库来创建一个 router 用来获取
                },
                child: const Text("Users"))
            ],
          ),
          Expanded(
            // 设置 GlobalKey，这里设置后，上面才能获取到
            child: AutoRouter(key: _innerRouterKey),
          ),
        ],
      ),
    );
  }
}