import 'package:flutter/material.dart';
import 'package:oopquiz/DatabaseHelper/repository.dart';
import 'package:timer_count_down/timer_controller.dart';

class QuizProvider with ChangeNotifier {
  double _progress = 0;
  String? _selected;

  final CountdownController _timerController = CountdownController();

  final PageController controller = PageController();

  double get progress => _progress;
  String? get selected => _selected;

  bool get isWin => _progress == 1.0;

  CountdownController get timerController => _timerController;

  set progress(double newValue) {
    _progress = newValue;
    notifyListeners();
  }

  set selected(String? newValue) {
    _selected = newValue;
    notifyListeners();
  }

  void initTimer(int duration) {
    _timerController.pause();

    notifyListeners();
  }

  void startTimer() {
    _timerController.start();
    notifyListeners();
  }

  void nextPage() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void goToPage(int index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
