import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:timer_count_down/timer_controller.dart';

class QuizProvider with ChangeNotifier {
  double _progress = 0;
  String? _selected;
  final int _counter = 1;

  int _currentPageIndex = 0;

  final CountdownController _publicTimeController = CountdownController();

  late List<bool> _quizAnswered;

  List<bool> get quizAnswered => _quizAnswered;

  set quizAnswered(List<bool> value) {
    _quizAnswered = value;
  }

  late int privetTimerControllersLength;
  late List<CountdownController> _privetTimerControllers;

  final PreloadPageController controller = PreloadPageController();

  QuizProvider({required this.privetTimerControllersLength}) {
    _privetTimerControllers =
        List.generate(privetTimerControllersLength, (index) {
      return CountdownController(autoStart: false);
    }, growable: false);

    quizAnswered = List.generate(privetTimerControllersLength, (index) => false,
        growable: false);
  }

  int get currentPageIndex => _currentPageIndex;

  set currentPageIndex(int value) {
    _currentPageIndex = value;
  }

  double get progress => _progress;
  String? get selected => _selected;

  bool get isWin => _progress == 1.0;

  CountdownController get publicTimeController => _publicTimeController;
  List<CountdownController> get privetTimerControllers =>
      _privetTimerControllers;

  set progress(double newValue) {
    _progress = newValue;
    notifyListeners();
  }

  set selected(String? newValue) {
    _selected = newValue;
    notifyListeners();
  }

  void startTimer() {
    _publicTimeController.start();
    privetTimerControllers[0].start();
    notifyListeners();
  }

  CountdownController getControllerForIndex(int index) {
    return privetTimerControllers[index];
  }

  void nextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
    notifyListeners();
  }

  void goToPage(int index) {
    if (index - 1 == 0 && getControllerForIndex(0).isCompleted == false) {
      startTimer();
    } else if (checkIfPreviewsQuizIsAnswered(index - 1)) {
      startCounter(index - 1);
    }

    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void setAnswerTrue(int idx) {
    quizAnswered[idx] = true;
  }

  void startNextCounter(int index) {
    // index here is for the current page
    if (checkIfPreviewsQuizIsAnswered(index + 1)) {
      startCounter(index + 1);
      notifyListeners();
    }
  }

  void startCounter(int index) {
    getControllerForIndex(index).start();
    notifyListeners();
  }

  bool checkIfPreviewsQuizIsAnswered(int index) {
    return index < privetTimerControllersLength &&
        index > 0 &&
        quizAnswered[index - 1];
  }
}
