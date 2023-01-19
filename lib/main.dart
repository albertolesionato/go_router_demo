import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/profile_screen.dart';
import 'package:go_router_demo/search_screen.dart';
import 'package:go_router_demo/sign_in_screen.dart';
import 'package:go_router_demo/update_profile_screen.dart';

import 'app_state.dart';
import 'home_screen.dart';
import 'menu_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class _BasicGoRoute extends GoRoute {
  _BasicGoRoute(
      {required super.path,
      required super.name,
      required GoRouterWidgetBuilder builder,
      super.routes,
      super.parentNavigatorKey})
      : super(pageBuilder: (context, state) {
          return NoTransitionPage(child: builder(context, state));
        });
}

final GoRouter _goRouter =
    GoRouter(initialLocation: '/sign-in', routes: <RouteBase>[
  _BasicGoRoute(
      name: 'sign-in',
      path: '/sign-in',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInScreen();
      }),
  ShellRoute(
      builder: (context, state, child) {
        return MenuScaffold(
          currentLocation: state.subloc,
          content: child,
        );
      },
      routes: [
        _BasicGoRoute(
            name: 'home',
            path: '/home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            }),
        _BasicGoRoute(
            name: 'search',
            path: '/search',
            builder: (BuildContext context, GoRouterState state) {
              return const SearchScreen();
            }),
        _BasicGoRoute(
            name: 'profile',
            path: '/profile',
            builder: (BuildContext context, GoRouterState state) {
              return const ProfileScreen();
            },
            routes: [
              _BasicGoRoute(
                  name: 'update-profile',
                  path: 'update-profile',
                  builder: (BuildContext context, GoRouterState state) {
                    return const UpdateProfileScreen();
                  }),
            ])
      ]),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppState(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Go_Router_Demo',
        theme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
                elevation: 0, backgroundColor: Colors.transparent),
            inputDecorationTheme:
                const InputDecorationTheme(border: OutlineInputBorder())),
        routerConfig: _goRouter,
      ),
    );
  }
}
