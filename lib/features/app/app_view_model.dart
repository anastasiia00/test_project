import 'package:flutter/material.dart';
import 'package:test_project/features/app/app_state.dart';

class AppViewModel extends InheritedWidget {
  const AppViewModel({
    Key? key,
    required this.setRandomColor,
    required this.changeText,
    required Widget child,
    required this.state,
  }) : super(key: key, child: child);

  final Function setRandomColor;
  final Function changeText;
  final AppState state;

  @override
  bool updateShouldNotify(AppViewModel oldWidget) {
    return state != oldWidget.state;
  }

  static of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppViewModel>();
  }
}
