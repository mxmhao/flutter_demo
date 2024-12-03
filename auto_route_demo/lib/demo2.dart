import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

// 自动生成的文件
part 'demo2.gr.dart';

// 演示传参 和等待返回结果
class Demo2App extends StatelessWidget {
  const Demo2App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = Demo2Router();

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

// 项目中有几个 AutoRouterConfig 就会生成几个 ".gr.dart" 文件，所以一般整个项目有一个就行了。
// 还要 import 所有带 @RoutePage() 的文件，生成的 ".gr.dart" 文件 才不会报错
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class Demo2Router extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.cupertino(); //.material, .cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Demo2Route1.page, initial: true),
    AutoRoute(page: Demo2Route2.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}

@RoutePage()
class Demo2Page1 extends StatefulWidget {
  const Demo2Page1({super.key});

  @override
  State<Demo2Page1> createState() => Demo2Page1State();
}

class Demo2Page1State extends State<Demo2Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Demo2"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // 演示传参，等待返回结果
            var result = await context.router.push<String>(Demo2Route2(book: "111"));
            if (null != result) print("result: ${result}");
          },
          child: const Text("Push", style: TextStyle(fontSize: 20),)
        ),
      ),
    );
  }
}

@RoutePage()
class Demo2Page2 extends StatelessWidget {

  String? book;

  Demo2Page2({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Page2"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // pop界面，并返回结果。还有一种方式就是传一个回调函数过来，用回调函数传结果
                  context.router.maybePop("我靠");
                },
                child: const Text("Pop", style: TextStyle(fontSize: 20),)
            ),
            if (null != book) Text("Book: ${book}")
          ],
        ),
      ),
    );
  }
}