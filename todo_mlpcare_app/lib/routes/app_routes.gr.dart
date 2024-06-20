// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:todo_mlpcare_app/data/tododata.dart' as _i5;
import 'package:todo_mlpcare_app/view/home_view.dart' as _i1;
import 'package:todo_mlpcare_app/view/update_text_view.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeView.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    UpdateTextView.name: (routeData) {
      final args = routeData.argsAs<UpdateTextViewArgs>(
          orElse: () => const UpdateTextViewArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.UpdateTextView(
          key: args.key,
          todo: args.todo,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeView]
class HomeView extends _i3.PageRouteInfo<void> {
  const HomeView({List<_i3.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.UpdateTextView]
class UpdateTextView extends _i3.PageRouteInfo<UpdateTextViewArgs> {
  UpdateTextView({
    _i4.Key? key,
    _i5.Todo? todo,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          UpdateTextView.name,
          args: UpdateTextViewArgs(
            key: key,
            todo: todo,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateTextView';

  static const _i3.PageInfo<UpdateTextViewArgs> page =
      _i3.PageInfo<UpdateTextViewArgs>(name);
}

class UpdateTextViewArgs {
  const UpdateTextViewArgs({
    this.key,
    this.todo,
  });

  final _i4.Key? key;

  final _i5.Todo? todo;

  @override
  String toString() {
    return 'UpdateTextViewArgs{key: $key, todo: $todo}';
  }
}
