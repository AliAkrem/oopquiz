import 'package:flutter/material.dart';
import 'package:oopquiz/Models/topic_model.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:oopquiz/Models/quiz_model.dart';

class QuizProvider with ChangeNotifier {
  double _progress = 0;
  String? _selected;
  int currentPageIndex = 0;
  final Topic topic;

  // //? public TimerController
  // final CountdownController _publicTimeController = CountdownController();

  //? state of answered quizzes
  late List<bool> quizAnswered;

  //? list of observer TimeController waiting to start
  late int quizLength;
  // late List<CountdownController> _privetTimerControllers;

  final PreloadPageController controller = PreloadPageController();

  QuizProvider(

      {required this.quizLength, required this.topic}) {
    // //? initialize list of observer
    // _privetTimerControllers =
    //     List.generate(quizLength, (index) {
    //   return CountdownController(autoStart: false);
    // }, growable: false);

    quizAnswered = List.generate(quizLength, (index) => false,
        growable: false);


    
  }

  double get progress => _progress;
  String? get selected => _selected;

  bool get isWin => _progress == 1.0;

  // CountdownController get publicTimeController => _publicTimeController;
  // List<CountdownController> get privetTimerControllers =>
  //     _privetTimerControllers;

  set progress(double newValue) {
    _progress = newValue;
    notifyListeners();
  }

  set selected(String? newValue) {
    _selected = newValue;
    notifyListeners();
  }

  // CountdownController getControllerForIndex(int index) {
  //   return privetTimerControllers[index];
  // }

  void nextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );

    notifyListeners();
  }

  //? handle jump between quizzes
  void goToPage(int index) {
    //? check if user jump to first quiz to start test
    // if (index - 1 == 0 && getControllerForIndex(0).isCompleted == false) {
    //   // startTimer();
    // } else if (checkIfPreviewsQuizIsAnswered(index - 1)) {
    //   startCounter(index - 1);
    // }

    controller.jumpToPage(
      index,
    );
  }

  // void startTimer() {
  //   _publicTimeController.start();
  //   privetTimerControllers[0].start();
  //   notifyListeners();
  // }

  // void startNextCounter(int index) {
  //   //? index here is for the current page
  //   if (checkIfPreviewsQuizIsAnswered(index + 1)) {
  //     startCounter(index + 1);
  //     notifyListeners();
  //   }
  // }

  // void startCounter(int index) {
  //   getControllerForIndex(index).start();
  //   notifyListeners();
  // }

  bool checkIfPreviewsQuizIsAnswered(int index) {
    return index < quizLength &&
        index > 0 &&
        quizAnswered[index - 1];
  }

  void setAnswerTrue(int idx, int quizId) {
    quizAnswered[idx] = true;
    QuizStoreManager.saveQuizStatus(quizId, true);
  }


  @override
  void dispose() {
    TopicStoreManager.revalidateProgress(topic);
    super.dispose();
  }
}
