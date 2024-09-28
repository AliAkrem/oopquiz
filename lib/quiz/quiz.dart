import 'package:oopquiz/Models/topic_model.dart';
import 'package:oopquiz/quiz/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:oopquiz/shared/leave_quiz_dialog.dart';
import 'package:preload_page_view/preload_page_view.dart';
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
          topic: widget.topic,
          quizLength: widget.topic.quizzes.length),
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
              title: Row(
                children: [
                  Expanded(
                      child: AnimatedProgressbar(value: quizState.progress)),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      // child: CountDownTimer(
                      //   duration: 420,
                      // )
                      )
                ],
              ),
            ),
            body: PreloadPageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: quizState.controller,
              preloadPagesCount: 1,
              onPageChanged: (int idx) {
                quizState.currentPageIndex = idx;
                quizState.progress = (idx / (quizzes.length + 1));
              },
              itemBuilder: (BuildContext context, int idx) {
                if (idx == 0) {
                  return StartPage(topic: widget.topic);
                } else if (idx > quizzes.length) {
                  return CongratsPage(topic: widget.topic);
                } else {
                  return QuestionPage(
                    questionIndex: idx - 1,
                    quiz: quizzes[idx - 1],
                    topic: widget.topic,
                  );
                }
              },
            ),
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
