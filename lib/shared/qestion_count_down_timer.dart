import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oopquiz/quiz/quiz_state.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class QuestionCountDownTimer extends StatefulWidget {
  final int idx;
  final int duration;
  final Function showAnswers;

  const QuestionCountDownTimer({
    super.key,
    required this.idx,
    required this.duration,
    required this.showAnswers,
  });

  @override
  State<QuestionCountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<QuestionCountDownTimer> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizProvider>(context);

    print("current page ${widget.idx}");

    print("Controller :  ${state.getControllerForIndex(widget.idx).hashCode}");

    return Countdown(
      seconds: widget.duration,
      controller: state.getControllerForIndex(widget.idx),
      onFinished: () {
        widget.showAnswers();
      },
      build: (_, double time) {
        return Text(
          formatDuration(time),
          style: TextStyle(
              fontSize: 24, color: time < 10 ? Colors.red : Colors.white),
        );
      },
      interval: const Duration(milliseconds: 1000),
      // duration: ,
    );
  }

  String formatDuration(double seconds) {
    Duration duration = Duration(seconds: seconds.toInt());
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
