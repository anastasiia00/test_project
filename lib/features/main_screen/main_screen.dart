import 'package:flutter/material.dart';
import 'package:test_project/features/app/app_view_model.dart';
import 'package:test_project/features/mood_screen/mood_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          AppViewModel.of(context).setRandomColor();
        },
        onDoubleTap: () {
          AppViewModel.of(context).changeText();
        },
        onLongPress: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    'You have a bad mood, or just want to have some endorphines tap "Let\'s go", if you don\'t want, tap "Close"',
                    textAlign: TextAlign.center,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MoodScreen(),
                        ),
                      );
                    },
                    child: const Text('Let\'s go'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          color: AppViewModel.of(context).state.backgroundColor,
          child: Center(
            child: Text(
              AppViewModel.of(context).state.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppViewModel.of(context).state.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
