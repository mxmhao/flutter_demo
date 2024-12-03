import 'package:auto_route_demo/pages/posts.page.dart';

import '../pages/settings.page.dart';
import '../pages/users.page.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../pages/login.page.dart';

// 自动生成的文件
part 'demo4.gr.dart';

// 演示 AutoTabsRouter， AutoTabsScaffold， AutoTabsRouter.pageView， AutoTabsRouter.tabBar
class Demo4App extends StatelessWidget {
  const Demo4App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = Demo4Router();

    // 设置 router
    return MaterialApp.router(
      title: 'auto_route',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
      // routerDelegate: appRouter.delegate(),
    );
  }
}

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class Demo4Router extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.material(); //.material, .cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    // 这也算是一种嵌套路由，也得配置子路由
    AutoRoute(page: Demo4DashboardRoute.page, initial: true, children: [
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
class Demo4DashboardPage extends StatelessWidget {

  // 演示 AutoTabsRouter， AutoTabsScaffold， AutoTabsRouter.pageView，AutoTabsRouter.tabBar
  @override
  Widget build(BuildContext context) {
    return _buildAutoTabsRouter(context);// 演示 AutoTabsRouter
    // return _buildAutoTabsScaffold(context);// 演示 AutoTabsScaffold
    // return _buildAutoTabsRouterPageView(context);// 演示 AutoTabsRouter.pageView, 可以左右滑动切换页面
    // return _buildAutoTabsRouterTabBar(context);// 演示 AutoTabsRouter.tabBar, 可以左右滑动切换页面
  }

  Widget _buildAutoTabsRouter(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        UsersRoute(),
        PostsRoute(),
        SettingsRoute(),
      ],
      // 自定义切换动画
      transitionBuilder: (context, child, animation) => FadeTransition(opacity: animation, child: child),
      builder: (BuildContext context, Widget child) {
        // 只能用当前作用域 context，不能用上面的 context，否则报错。报错原理：获取最近的router，这里是自己的嵌套路由，父组件的router管不了这里
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child, // 这里注意，要用传入的 child，你可以当做 demo3 中的 AutoRouter()，用来占位的
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(tabsRouter.current.name),
            leading: const AutoLeadingButton(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12, // 默认大小
            selectedItemColor: Colors.red,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
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

  Widget _buildAutoTabsScaffold(BuildContext context) {
    // 比 AutoTabsRouter 看起更干净。层级少了
    return AutoTabsScaffold(
      routes: const [
        UsersRoute(),
        PostsRoute(),
        SettingsRoute(),
      ],
      appBarBuilder: (BuildContext context, TabsRouter tabsRouter) {
        return AppBar(
          backgroundColor: Colors.green,
          title: Text(tabsRouter.current.name),
          leading: const AutoLeadingButton(),
        );
      },
      bottomNavigationBuilder: (BuildContext context, TabsRouter tabsRouter) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12, // 默认大小
            selectedItemColor: Colors.red,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Users"),
              BottomNavigationBarItem(icon: Icon(Icons.local_post_office), label: "Posts"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
            ]
        );
      },
    );
  }

  Widget _buildAutoTabsRouterPageView(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        UsersRoute(),
        PostsRoute(),
        SettingsRoute(),
      ],
      builder: (BuildContext context, Widget child, PageController pageController) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child, // 这里注意，要用传入的 child，你可以当成是一种 PageView（而不是 PageView 的 children 的子组件）
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(tabsRouter.current.name),
            leading: const AutoLeadingButton(),
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12, // 默认大小
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

  Widget _buildAutoTabsRouterTabBar(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        UsersRoute(),
        PostsRoute(),
        SettingsRoute(),
      ],
      // 自定义切换动画
      builder: (BuildContext context, Widget child, TabController tabController) {
        // 只能用这里的 context，不能用上面的 context，否则报错。报错原理：获取最近的router，父组件的router管不了这里
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child, // 这里注意，要用传入的 child，你可以当成一种 TabBarView（而不是 TabBarView 的 children 的子组件）
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(tabsRouter.current.name),
            bottom: TabBar(
              controller: tabController, // 上面传入
              tabs: const [
                Tab(text: '1', icon: Icon(Icons.abc)),
                Tab(text: '2', icon: Icon(Icons.abc)),
                Tab(text: '3', icon: Icon(Icons.abc)),
              ],
            ),
          )
        );
      },
    );
  }
}