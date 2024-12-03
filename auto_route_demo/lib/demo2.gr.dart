// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'demo2.dart';

/// generated route for
/// [Demo2Page1]
class Demo2Route1 extends PageRouteInfo<void> {
  const Demo2Route1({List<PageRouteInfo>? children})
      : super(
          Demo2Route1.name,
          initialChildren: children,
        );

  static const String name = 'Demo2Route1';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Demo2Page1();
    },
  );
}

/// generated route for
/// [Demo2Page2]
class Demo2Route2 extends PageRouteInfo<Demo2Route2Args> {
  Demo2Route2({
    Key? key,
    String? book,
    List<PageRouteInfo>? children,
  }) : super(
          Demo2Route2.name,
          args: Demo2Route2Args(
            key: key,
            book: book,
          ),
          initialChildren: children,
        );

  static const String name = 'Demo2Route2';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<Demo2Route2Args>(orElse: () => const Demo2Route2Args());
      return Demo2Page2(
        key: args.key,
        book: args.book,
      );
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
