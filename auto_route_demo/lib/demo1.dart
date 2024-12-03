import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

// 自动生成的文件，必须这么写，加上这句再去执行生成文件命令会更好
part 'demo1.gr.dart';

class Demo1App extends StatelessWidget {
  const Demo1App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = Demo1Router();

    // 设置 router
    return MaterialApp.router(
      title: 'auto_route',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
      // routerDelegate: appRouter.delegate(), routerDelegate 是系统传过来的路由，例如：启动app是哦
    );
  }
}

// 项目中有几个 AutoRouterConfig 就会生成几个 ".gr.dart" 文件，所以一般整个项目有一个就行了。
// 还要 import 所有带 @RoutePage() 的文件，生成的 ".gr.dart" 文件 才不会报错
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class Demo1Router extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.cupertino(); //.material, .cupertino, .adaptive ..etc

  // 在上面未设置 routerDelegate 的情况下，无法定位到首页，下面有2种方式设置首页
  @override
  List<AutoRoute> get routes => [
    // 方式一：initial 参数设置true
    AutoRoute(page: HomeRoute.page, initial: true),
    // 方式二：path 参数设置为'/'
    // AutoRoute(path:'/', page: HomeRoute.page),

    // 要把所有的路由添加到此列表中，否则无法路由到此界面，此列表只是个列表，不是真正的路由堆栈。
    // 不信可以注释此行，然后点击 push 按钮就会崩溃
    AutoRoute(page: Demo1Route2.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
/* HomeScreen 原本是要生成 class HomeScreen extends PageRouteInfo
上面的 (replaceInRouteName: 'Screen|Page,Route') 设置，把 HomeScreen 改成了 HomeRoute
防止类名相同冲突。所以上面用的是 HomeRoute.page
 */
@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// 使用路由切换页面：https://pub.dev/packages/auto_route#navigating-between-screens
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Demo1"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.router.push(const Demo1Route2()),
          child: const Text("Push", style: TextStyle(fontSize: 20),)
        ),
      ),
    );
  }
}

@RoutePage()
class Demo1Page2 extends StatelessWidget {
  const Demo1Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Page2"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: context.router.maybePop,
            child: const Text("Pop", style: TextStyle(fontSize: 20),)
        ),
      ),
    );
  }
}