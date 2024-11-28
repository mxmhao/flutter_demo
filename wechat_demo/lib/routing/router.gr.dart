// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:wechat_demo/pages/chat.dart' as _i4;
import 'package:wechat_demo/pages/root_page.dart' as _i1;
import 'package:wechat_demo/pages/search_page.dart' as _i2;

/// generated route for
/// [_i1.RootPage]
class RootRoute extends _i3.PageRouteInfo<void> {
  const RootRoute({List<_i3.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i1.RootPage();
    },
  );
}

/// generated route for
/// [_i2.SearchPage]
class SearchRoute extends _i3.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    required List<_i4.Chat>? list,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(list: list),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchRouteArgs>();
      return _i2.SearchPage(args.list);
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({required this.list});

  final List<_i4.Chat>? list;

  @override
  String toString() {
    return 'SearchRouteArgs{list: $list}';
  }
}
