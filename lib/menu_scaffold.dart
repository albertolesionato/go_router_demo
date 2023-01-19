import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_state.dart';

class _MenuItem {
  const _MenuItem(
      {required this.location, required this.icon, required this.title});

  static const List<_MenuItem> appMenuItems = [
    _MenuItem(location: '/home', icon: Icon(Icons.home_filled), title: 'Home'),
    _MenuItem(location: '/search', icon: Icon(Icons.search), title: 'Search'),
    _MenuItem(location: '/profile', icon: Icon(Icons.person), title: 'Profile')
  ];

  final String location;
  final Icon icon;
  final String title;
}

class MenuScaffold extends StatelessWidget {
  const MenuScaffold(
      {Key? key, required this.content, required this.currentLocation,
      this.preserveState = false})
      : super(key: key);

  final String currentLocation;
  final Widget content;
  final bool preserveState;

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 120,
            child: Column(
              children: [
                const SizedBox(height: 50),
                for (var item in _MenuItem.appMenuItems)
                  InkWell(
                    onTap: () {
                      context.go(item.location);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [item.icon,
                          const SizedBox(width: 8,),Text(item.title)],
                      ),
                    ),
                  )
              ],
            ),
          ),
          Expanded(
            child: content,
          )
        ],
      ),
    );
  }
}
