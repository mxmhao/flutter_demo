import 'package:auto_route_demo/pages/posts.page.dart';

import '../pages/settings.page.dart';
import '../pages/users.page.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../pages/login.page.dart';

// 自动生成的文件
part 'demo5.gr.dart';

// 演示获取当前路由，父路由，根路由
class Demo5App extends StatelessWidget {
  const Demo5App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = Demo5Router();

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
class Demo5Router extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.material(); //.material, .cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Demo5DashboardRoute.page, initial: true, children: [
      AutoRoute(page: UsersRoute.page),
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
class Demo5DashboardPage extends StatelessWidget {
  const Demo5DashboardPage({super.key});


  @override
  Widget build(BuildContext context) {
    return _buildAutoTabsRouterPageView(context);
  }

  Widget _buildAutoTabsRouterPageView(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        UsersRoute(),
        PostsRoute(),
        SettingsRoute(),
      ],
      builder: (BuildContext context, Widget child, PageController pageController) {
        // 或获取当前路由，只能是当前 context
        final tabsRouter = AutoTabsRouter.of(context);
        // tabsRouter.parent<StackRouter>(); // 获取父路由
        // tabsRouter.parent<TabsRouter>(); // 获取父路由
        // tabsRouter.root; // 获取根路由

        return Scaffold(
          body: child,
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(tabsRouter.current.name),
            leading: const AutoLeadingButton(),
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              selectedItemColor: Colors.red,
              currentIndex: tabsRouter.activeIndex,
              onTap: pageController.jumpToPage, // 这两个都可以
              // onTap: tabsRouter.setActiveIndex, // 这也可以
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Users"),
                BottomNavigationBarItem(icon: Icon(Icons.local_post_office), label: "Posts"),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
              ]
          ),
        );
      },
    );
  }
}