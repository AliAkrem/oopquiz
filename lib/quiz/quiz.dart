import 'package:oopquiz/Models/topic_model.dart';
import 'package:oopquiz/quiz/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:oopquiz/shared/leave_quiz_dialog.dart';
import 'package:provider/provider.dart';
import 'package:oopquiz/shared/shared.dart';

class QuizScreen extends StatefulWidget {
  final Topic topic;

  const QuizScreen({super.key, required this.topic});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider(
          topic: widget.topic, quizLength: widget.topic.quizzes.length),
      builder: (context, child) {
        var quizState = Provider.of<QuizProvider>(context);
        var quizzes = widget.topic.quizzes;

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            showLeaveAlertDialog(context);
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.topic.name),
            ),
            body: Stack(children: [
              PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: quizState.controller,
                onPageChanged: (int idx) {
                  quizState.currentPageIndex = idx;
                  quizState.progress = (idx / (quizzes.length + 1));
                },
                itemBuilder: (BuildContext context, int idx) {
                  if (idx == 0) {
                    return StartPage(topic: widget.topic);
                  } else if (idx > quizzes.length) {
                    if (!quizState.quizAnswered
                        .every((element) => element == true)) {
                      quizState.controller.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }

                    return CongratsPage(topic: widget.topic);
                  } else if (quizState.quizAnswered
                      .every((element) => element == true)) {
                    return CongratsPage(topic: widget.topic);
                  } else {
                    if (widget.topic.topicId == 5) {
                      return ExamplePage(
                        quiz: quizzes[idx - 1],
                        topic: widget.topic,
                      );
                    }

                    return QuestionPage(
                      questionIndex: idx - 1,
                      quiz: quizzes[idx - 1],
                      topic: widget.topic,
                    );
                  }
                },
              ),
              Positioned(
                top: 0, // Position it just under the AppBar
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 1.2, // Height of the progress bar
                  child: LinearProgressIndicator(
                    value: quizState.progress,
                    backgroundColor: Colors
                        .grey[300], // Light background to blend with the shadow
                    color: Colors.blue, // Progress bar color
                  ),
                ),
              ),
            ]),
            drawer: Drawer(
                child: QuizDrawer(
              quizzes: widget.topic.quizzes,
            )),
          ),
        );
      },
      // ),
    );
  }
}
