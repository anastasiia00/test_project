import 'package:flutter/material.dart';
import 'package:test_project/features/app/app_state.dart';
import 'package:test_project/utils/utils.dart';

import 'app_view_model.dart';

const List<String> texts = [
  'Hello there!)',
  'I\'m the test application, so I should said only "Hello there!)", please don\'t double tap againg :)',
  'Oh, I understand, you want to know about me something else',
  'The girl who made me named Nastya and she likes to having fun)',
  'It\'s all thanks',
  '.',
  '..',
  '...',
  '....',
  '.....',
  '......',
  '.......',
  '........',
  '... ok let\'s go again)',
];

class AppViewModelWidget extends StatefulWidget {
  const AppViewModelWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppViewModelWidget> createState() => _AppViewModelWidgetState();
}

class _AppViewModelWidgetState extends State<AppViewModelWidget> {
  final Utils utils = Utils();
  AppState state = AppState(
    backgroundColor: Colors.white,
    textColor: Colors.black,
    text: texts[0],
  );

  @override
  Widget build(BuildContext context) {
    return AppViewModel(
      state: state,
      setRandomColor: () {
        final Color newBackgroundColor = utils.getRandomColor();
        state = state.copyWith(
          backgroundColor: newBackgroundColor,
          textColor: utils.calculateTextColor(newBackgroundColor),
        );
        setState(() {});
      },
      changeText: () {
        final int textIndex = texts.indexOf(state.text);
        String text = "";
        if (textIndex < 0 || textIndex < texts.length - 1) {
          text = texts[textIndex + 1];
        } else {
          text = texts[0];
        }
        state = state.copyWith(
          text: text,
        );
        setState(() {});
      },
      child: widget.child,
    );
  }
}
