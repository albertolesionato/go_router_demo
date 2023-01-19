import 'package:flutter/material.dart';

class AppState extends InheritedWidget {
  AppState({super.key, AppStateData? data, required super.child}) {
    this.data = data ?? AppStateData();
  }

  late final AppStateData data;

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppState>()!;
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return oldWidget.data != data;
  }
}

class AppStateData {
  AppStateData({this.username});

  String? username;
}
