import 'dart:ui';

import 'package:markdown_widget/markdown_widget.dart';
import 'package:oopquiz/Models/quiz_model.dart';
import 'package:oopquiz/Models/topic_model.dart';
import 'package:oopquiz/quiz/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:oopquiz/shared/qestion_count_down_timer.dart';
import 'package:provider/provider.dart';
import 'package:oopquiz/shared/shared.dart';
import 'package:timer_count_down/timer_controller.dart';

class QuestionPage extends StatefulWidget {
  final int questionIndex;
  final Quiz quiz;
  final Topic topic;
  const QuestionPage(
      {super.key,
      required this.quiz,
      required this.topic,
      required this.questionIndex});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // This ensures the widget is kept alive

  bool isAnswersShowed = false;
  void showAnswers() {
    setState(() {
      isAnswersShowed = true;
    });
  }

  Widget buildMarkdown(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final config =
        isDark ? MarkdownConfig.darkConfig : MarkdownConfig.defaultConfig;

    codeWrapper(child, text, language) => CodeWrapperWidget(
          child,
          text,
          language,
        );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MarkdownWidget(
          data: widget.quiz.questionContent,
          config: config.copy(configs: [
            isDark
                ? PreConfig.darkConfig.copy(
                    wrapper: codeWrapper,
                  )
                : const PreConfig().copy(wrapper: codeWrapper)
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizProvider>(context);
    super.build(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 2,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              alignment: Alignment.center,
              child: buildMarkdown(context)),
        ),
        Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              ...widget.quiz.answers.map<Widget>((opt) {
                return Container(
                  // height: MediaQuery.of(context).size.height *0.1,
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 16, right: 16),

                  color: Colors.black26,
                  child: InkWell(
                    onTap: () {
                      state.selected = opt;
                      _bottomSheet(context, opt, state, widget.quiz.quizId);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            (state.selected == opt &&
                                    opt ==
                                        widget.quiz
                                            .answers[widget.quiz.correctAnswer])
                                ? Icons.check_circle_outline
                                : state.selected != opt
                                    ? Icons.circle_outlined
                                    : Icons.cancel_outlined,
                            size: 30,
                            color: state.selected == opt &&
                                    opt ==
                                        widget.quiz
                                            .answers[widget.quiz.correctAnswer]
                                ? Colors.green
                                : state.selected != opt
                                    ? Colors.white
                                    : Colors.red,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 16),
                              child: Text(
                                opt,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ]),
          ),
          (!isAnswersShowed)
              ? Positioned.fill(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 2.0, sigmaY: 2.0), // Blur effect
                      child: Container(
                        color: Colors.black
                            .withOpacity(0.3), // Optional color overlay
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Answers will be displayed after...',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              // You can add a countdown timer or any other widget here
                              QuestionCountDownTimer(
                                idx: widget.questionIndex,
                                showAnswers: showAnswers,
                                duration: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ])
      ],
    );
  }

  _bottomSheet(
      BuildContext context, dynamic opt, QuizProvider state, String quizId) {
    bool correct = opt == widget.quiz.answers[widget.quiz.correctAnswer];

    if (correct) {
      //TODO implement set quiz answared function here
      state.selected = '';

      state.setAnswerTrue(widget.questionIndex);
      print('response is correct');
    } else {
      print('response is incorrect');
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
                    state.nextPage();
                    state.startNextCounter(widget.questionIndex);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
