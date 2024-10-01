import 'package:flutter/material.dart';
import 'package:oopquiz/Models/quiz_model.dart';
import 'package:oopquiz/quiz/quiz_state.dart';
import 'package:provider/provider.dart';

class Answer extends StatefulWidget {
  final int questionIndex;
  final String option;
  final Quiz quiz;
  const Answer(
      {super.key,
      required this.option,
      required this.quiz,
      required this.questionIndex});

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizProvider>(context);

    var alreadyAnswered = state.quizAnswered[widget.questionIndex] &&
        widget.option == widget.quiz.answers[widget.quiz.correctAnswer];

    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
      color: Colors.black26,
      child: InkWell(
        onTap: () {
          state.selected = widget.option;
          _bottomSheet(context, widget.option, state, widget.quiz.quizId);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Icon(
                alreadyAnswered
                    ? Icons.check_circle_outline
                    : state.selected != widget.option
                        ? Icons.circle_outlined
                        : Icons.cancel_outlined,
                size: 30,
                color: alreadyAnswered
                    ? Colors.green
                    : state.selected != widget.option
                        ? Colors.white
                        : Colors.red,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Text(
                    widget.option,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _bottomSheet(
      BuildContext context, dynamic opt, QuizProvider state, int quizId) {
    bool correct = opt == widget.quiz.answers[widget.quiz.correctAnswer];

    if (correct) {
      state.selected = '';
      state.setAnswerTrue(widget.questionIndex, quizId);
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(correct ? 'Good Job!' : 'Wrong'),
              Text(
                widget.quiz.details,
                style: const TextStyle(fontSize: 18, color: Colors.white54),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: correct ? Colors.green : Colors.red),
                child: Text(
                  correct ? 'Onward!' : 'Try Again',
                  style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (correct) {
                    if (state.quizAnswered
                        .every((element) => element == true)) {
                      Navigator.pop(context);
                    } else {
                      state.nextPage();
                      Navigator.pop(context);
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
