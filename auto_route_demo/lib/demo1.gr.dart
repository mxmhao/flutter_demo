// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'demo1.dart';

/// generated route for
/// [Demo1Page2]
class Demo1Route2 extends PageRouteInfo<void> {
  const Demo1Route2({List<PageRouteInfo>? children})
      : super(
          Demo1Route2.name,
          initialChildren: children,
        );

  static const String name = 'Demo1Route2';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Demo1Page2();
    },
  );
}

class Demo2Route2Args {
  const Demo2Route2Args({
    this.key,
    this.book,
  });

  final Key? key;

  final String? book;

  @override
  String toString() {
    return 'Demo2Route2Args{key: $key, book: $book}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}
