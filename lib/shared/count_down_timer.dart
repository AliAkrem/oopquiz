import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oopquiz/quiz/quiz_state.dart';
import 'package:oopquiz/shared/time_up_dialog.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CountDownTimer extends StatefulWidget {
  final int duration;
  final bool? autoStart;
  const CountDownTimer({super.key, required this.duration, this.autoStart});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Color color = Colors.green;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizProvider>(context);

    return Countdown(
      seconds: widget.duration,
      controller: CountdownController(
        autoStart: true,
      ),

      onFinished: () {
        showTimeUpAlertDialog(context);
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
